package com.guet.controller;

import com.guet.annotation.AuthLogin;
import com.guet.entity.Passenger;
import com.guet.service.IPassengerService;
import com.guet.utils.ServiceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class PassengerController {

    @Autowired
    private IPassengerService passengerService;

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "passenger/{pId}",method = RequestMethod.GET)
    public Map<String,Object> queryPassenger(@PathVariable("pId")Long pId){
        Map<String,Object> map = new HashMap<>();
        try {
            Passenger passenger = passengerService.getPassenger(pId);
            if(passenger!=null){
                map.put("passenger",passenger);
            }else{
                map.put("err","获取失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","获取失败！");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "passenger",method = RequestMethod.POST)
    public Map<String,Object> addUserPassenger(@RequestBody Passenger passenger,
                                                HttpServletRequest request){
        Long uId = ServiceUtils.getUid(request);
        passenger.setuId(uId);
        Map<String,Object> map = new HashMap<>();
        try {
            passengerService.addPassenger(passenger);
            map.put("msg","添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","添加失败！");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "passenger/{id}",method = RequestMethod.DELETE)
    public Map<String,Object> deleteUserPassenger(@PathVariable("id") Long id,
                                                HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        try {
            passengerService.deletePassenger(id);
            map.put("msg","删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","删除失败！");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "passenger",method = RequestMethod.PUT)
    public Map<String,Object> updateUserPassenger(@RequestBody Passenger passenger,
                                                   HttpServletRequest request){
        Long uId = ServiceUtils.getUid(request);
        passenger.setuId(uId);
        Map<String,Object> map = new HashMap<>();
        try {
            passengerService.updatePassenger(passenger);
            map.put("msg","修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","修改失败！");
        }
        return map;
    }
}
