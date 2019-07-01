package com.guet.controller;

import com.guet.annotation.AuthLogin;
import com.guet.service.IPassengerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class PassengerController {

    @Autowired
    private IPassengerService passengerService;

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "buspassenger/{bsId}",method = RequestMethod.GET)
    public Map<String,Object> queryPassengerByBsId(@PathVariable("bsId") Long bsId){
        Map<String,Object> map = new HashMap<>();
        try {
            map.put("passenger",passengerService.getPassengerByBsId(bsId));
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","乘客信息获取失败");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "trainpassenger/{tsId}",method = RequestMethod.GET)
    public Map<String,Object> queryPassengerByTsId(@PathVariable("tsId") Long tsId){
        Map<String,Object> map = new HashMap<>();
        try {
            map.put("passenger",passengerService.getPassengerByTsId(tsId));
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","乘客信息获取失败");
        }
        return map;
    }
}
