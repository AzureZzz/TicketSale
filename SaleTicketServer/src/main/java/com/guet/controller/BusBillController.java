package com.guet.controller;

import com.guet.annotation.AuthLogin;
import com.guet.entity.BusBill;
import com.guet.exceptions.BalanceNotEnoughException;
import com.guet.service.IBusBillService;
import com.guet.service.IUserService;
import com.guet.utils.ServiceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class BusBillController {

    @Autowired
    private IBusBillService busBillService;

    @Autowired
    private IUserService userService;

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "busbill",method = RequestMethod.POST)
    public Map<String,Object> addBusBill(@RequestBody BusBill busBill,
                                         HttpServletRequest request){
        Map<String , Object> map = new HashMap<>();
        Long uId = ServiceUtils.getUid(request);
        busBill.setuId(uId);
        try {
            System.out.println(busBill.getBillType());
            busBillService.addBusBill(busBill);
            map.put("msg","购票成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","购票失败！");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "busbill",method = RequestMethod.PUT)
    public Map<String,Object> payBusBill(@RequestBody Map<String ,Object> body,HttpServletRequest request){

        Long uId = ServiceUtils.getUid(request);
        String payPass= (String) body.get("payPass");
        Long bbId = Long.valueOf((String) body.get("bbId"));
        Map<String , Object> map = new HashMap<>();
        try {
            if(userService.authPayPass(uId,payPass)){
                Float cost = busBillService.payBusBill(bbId,uId);
                map.put("msg","支付成功！本次支付"+cost+"元");
            }else{
                map.put("err","支付密码不正确！");
                return map;
            }
        } catch (BalanceNotEnoughException e){
            e.printStackTrace();
            map.put("err","余额不足！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","支付失败！");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "busbill/{id}",method = RequestMethod.DELETE)
    public Map<String,Object> returnBusBill(@PathVariable("id") Long bbId,HttpServletRequest request){
        Long uId = ServiceUtils.getUid(request);
        Map<String , Object> map = new HashMap<>();
        try {
            Float result = busBillService.returnBusBill(bbId,uId);
            if(result == null){
                map.put("msg","退票成功！");
            }else{
                map.put("msg","退票成功！退款"+result+"元");
            }
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","退票失败！");
        }
        return map;
    }

}
