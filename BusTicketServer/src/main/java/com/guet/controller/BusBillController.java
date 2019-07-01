package com.guet.controller;

import com.guet.annotation.AuthLogin;
import com.guet.entity.BusBill;
import com.guet.service.IBusBillService;
import com.guet.utils.LayUITableUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Controller
public class BusBillController {

    @Autowired
    private IBusBillService busBillService;

    @Autowired
    private LayUITableUtils<BusBill> layUITableUtils;

//    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "busbill/{id}",method = RequestMethod.GET)
    public Map<String,Object> getBusBill(@PathVariable(value = "id")Long id){
        Map<String ,Object> map = new HashMap<>();
        try {
            BusBill busBill = busBillService.getBusBill(id);
            map.put("busBill",busBill);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "busbills/{state}",method = RequestMethod.GET)
    public Map<String,Object> getUserBusBills(@PathVariable("state") int state,
                                              HttpServletRequest request,
                                              @RequestParam int page,@RequestParam int limit){
        Map<String ,Object> map = new HashMap<>();
        Long uId = null;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie:cookies) {
            if(cookie.getName().equals("token")){
               uId = Long.valueOf(cookie.getValue());
            }
        }
        try {
            List<BusBill> busBills = null;
            if(state == 0){
                busBills = busBillService.getUserBusBillsUnPay(uId);
            }else{
                busBills = busBillService.getUserBusBillsPay(uId);
            }
            map = layUITableUtils.getLayUIMap(busBills);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }
}
