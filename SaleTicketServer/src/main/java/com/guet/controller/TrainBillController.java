package com.guet.controller;

import com.guet.annotation.AuthLogin;
import com.guet.entity.TrainBill;
import com.guet.exceptions.BalanceNotEnoughException;
import com.guet.service.ITrainBillService;
import com.guet.service.IUserService;
import com.guet.utils.ServiceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class TrainBillController {

    @Autowired
    private ITrainBillService trainBillService;

    @Autowired
    private IUserService userService;
    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "trainbill",method = RequestMethod.POST)
    public Map<String,Object> addBusBill(@RequestBody TrainBill trainBill, HttpServletRequest request){
        Map<String , Object> map = new HashMap<>();
//        Long uId = ServiceUtils.getUid(request);
        trainBill.setuId((long) 14);
        try {
            trainBillService.addTrainBill(trainBill);
            map.put("msg","购票成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","购票失败！");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "trainbill",method = RequestMethod.PUT)
    public Map<String,Object> payBusBill(@RequestBody Map<String ,Object> body,HttpServletRequest request){
        Long uId = ServiceUtils.getUid(request);
        String payPass= (String) body.get("payPass");
        Long tbId = Long.valueOf((String) body.get("tbId"));
        Map<String , Object> map = new HashMap<>();
        try {
            if(userService.authPayPass(uId,payPass)){
                Float cost = trainBillService.payTrainBill(tbId,uId);
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
    @RequestMapping(value = "trainbill/{id}",method = RequestMethod.DELETE)
    public Map<String,Object> returnBusBill(@PathVariable("id") Long tbId,HttpServletRequest request){
        Long uId = ServiceUtils.getUid(request);
        Map<String , Object> map = new HashMap<>();
        try {
            Float result = trainBillService.returnTrainBill(tbId,uId);
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
