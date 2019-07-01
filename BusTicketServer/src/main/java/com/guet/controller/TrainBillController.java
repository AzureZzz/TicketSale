package com.guet.controller;

import com.guet.annotation.AuthLogin;
import com.guet.entity.TrainBill;
import com.guet.service.ITrainBillService;
import com.guet.utils.LayUITableUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TrainBillController {

    @Autowired
    private ITrainBillService trainBillService;

    @Autowired
    private LayUITableUtils<TrainBill> layUITableUtils;

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "trainbill/{id}",method = RequestMethod.GET)
    public Map<String,Object> getTrainBill(@PathVariable(value = "id")Long id){
        Map<String ,Object> map = new HashMap<>();
        try {
            TrainBill trainBill = trainBillService.getTrainBill(id);
            map.put("trainBill",trainBill);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "trainbills/{state}",method = RequestMethod.GET)
    public Map<String,Object> getUserTrainBills(@PathVariable(value = "state")int state,
                                                HttpServletRequest request,
                                                @RequestParam int page, @RequestParam int limit){
        Map<String ,Object> map = new HashMap<>();
        Long uId = null;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie:cookies) {
            if(cookie.getName().equals("token")){
                uId = Long.valueOf(cookie.getValue());
            }
        }
        try {
            List<TrainBill> trainBills = null;
            if(state == 0){
                trainBills = trainBillService.getUserTrainBillsUnPay(uId);
            }else{
                trainBills = trainBillService.getUserTrainBillsPay(uId);
            }
            map = layUITableUtils.getLayUIMap(trainBills);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }
}
