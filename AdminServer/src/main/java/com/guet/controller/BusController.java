package com.guet.controller;

import com.guet.annotation.AuthLogin;
import com.guet.entity.BusBill;
import com.guet.entity.BusNum;
import com.guet.entity.BusTicketInfo;
import com.guet.service.IBusBillService;
import com.guet.service.IBusNumService;
import com.guet.service.IBusTicketService;
import com.guet.utils.LayUITableUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BusController {

    @Autowired
    private IBusBillService busBillService;

    @Autowired
    private IBusTicketService busTicketService;

    @Autowired
    private IBusNumService busNumService;

    @Autowired
    private LayUITableUtils<BusBill> layUIBusBill;

    @Autowired
    private LayUITableUtils<BusTicketInfo> layUIBusTicket;

    @Autowired
    private LayUITableUtils<BusNum> layUIBusNum;

//    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "busBill/today",method = RequestMethod.GET)
    public Map<String,Object> queryBusBillsToday(@RequestParam Integer page, @RequestParam Integer limit){
        Map<String,Object> map = null;
        try {
            map = layUIBusBill.getLayUIMap(busBillService.getTodaySale(page,limit),busBillService.getTodayCount());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "busBill/user",method = RequestMethod.GET)
    public Map<String,Object> queryBusBillsUser(@RequestParam Integer page, @RequestParam Integer limit,
                                                @RequestParam String key){
        Map<String,Object> map = null;
        try {
            map = layUIBusBill.getLayUIMap(busBillService.getUserBusBill(page,limit,key),busBillService.getUserBusBillCount(key));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "busTicket/remain",method = RequestMethod.POST)
    public Map<String,Object> addReminBusTickets(@RequestBody Map<String,Object> body){
        Integer count = Integer.valueOf((String) body.get("count"));
        String numNo = (String) body.get("numNo");
        Map<String,Object> map = new HashMap<>();
        try {
            busTicketService.addBusTickets(numNo,count);
            map.put("msg","添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","添加失败！");
        }
        return map;
    }

//    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "busTicket/remain",method = RequestMethod.GET)
    public Map<String,Object> queryReminBusTicket(@RequestParam Integer page, @RequestParam Integer limit){
        Map<String,Object> map = null;
        try {
            map = layUIBusTicket.getLayUIMap(busTicketService.getReaminBusTicket(page,limit),busTicketService.getRemainCount());
            System.out.println(map.get("count"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "busTicket/remain",method = RequestMethod.PUT)
    public Map<String,Object> updateReminBusTicket(@RequestBody Map<String,Object> body){
        Long bsId = Long.valueOf((String) body.get("bsId"));
        String numNo = (String) body.get("numNo");
        String seatNo = (String) body.get("seatNo");
        Map<String,Object> map = new HashMap<>();
        try {
            busTicketService.updateBusTicket(bsId,numNo,seatNo);
            map.put("msg","修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","修改失败！");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "busTicket/remain/{bsId}",method = RequestMethod.DELETE)
    public Map<String,Object> deleteReminBusTicket(@PathVariable("bsId")Long bsId){
        Map<String,Object> map = new HashMap<>();
        try {
            busTicketService.deleteBusTicket(bsId);
            map.put("msg","删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","删除失败！");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "busTicket/remain",method = RequestMethod.DELETE)
    public Map<String,Object> deleteReminBusTickets(@RequestBody Map<String,Object> body){
        List<Integer> ids = (List<Integer>) body.get("ids");
        Map<String,Object> map = new HashMap<>();
        try {
            for (Integer bsId:ids) {
                busTicketService.deleteBusTicket(Long.valueOf(bsId+""));
            }
            map.put("msg","删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","删除失败！");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "busTicket/sale",method = RequestMethod.GET)
    public Map<String,Object> querySaleBusTicket(@RequestParam Integer page, @RequestParam Integer limit){
        Map<String,Object> map = new HashMap<>();
        try {
            map = layUIBusTicket.getLayUIMap(busTicketService.getSaleBusTicket(page,limit),busTicketService.getSaleCount());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "busNum/station",method = RequestMethod.GET)
    public Map<String,Object> queryBusNum(@RequestParam Integer page, @RequestParam Integer limit,
                                          @RequestParam String key){
        Map<String,Object> map = null;
        try {
            map = layUIBusNum.getLayUIMap(busNumService.getBusNumByStation(page,limit,key),busNumService.getBusNumCountBuStation(key));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "busNum",method = RequestMethod.POST)
    public Map<String,Object> addBusNum(@RequestBody Map<String,Object> body){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        BusNum busNum = new BusNum();
        busNum.setStartStation((String) body.get("startStation"));
        busNum.setDesStation((String) body.get("desStation"));
        try {
            busNum.setGoOff(simpleDateFormat.parse((String) body.get("goOff")));
            busNum.setArriveTime(simpleDateFormat.parse((String) body.get("arriveTime")));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        busNum.setBusType((String) body.get("busType"));
        busNum.setPiece(Float.valueOf((String) body.get("piece")));
        busNum.setNumNo((String) body.get("numNo"));
        Map<String,Object> map = new HashMap<>();
        try {
            busNumService.addBusNum(busNum);
            map.put("msg","添加成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg","添加失败");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "busNum/{bId}",method = RequestMethod.DELETE)
    public Map<String,Object> deleteBusNum(@PathVariable("bId")Long bId){
        Map<String,Object> map = new HashMap<>();
        try {
            busNumService.deleteBusNum(bId);
            map.put("msg","删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg","删除失败");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "busNum",method = RequestMethod.PUT)
    public Map<String,Object> updateBusNum(@RequestBody Map<String,Object> body){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        BusNum busNum = new BusNum();
        busNum.setbId(Long.valueOf((String)body.get("bId")));
        busNum.setStartStation((String) body.get("startStation"));
        busNum.setDesStation((String) body.get("desStation"));
        try {
            busNum.setGoOff(simpleDateFormat.parse((String) body.get("goOff")));
            busNum.setArriveTime(simpleDateFormat.parse((String) body.get("arriveTime")));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        busNum.setBusType((String) body.get("busType"));
        busNum.setPiece(Float.valueOf((String) body.get("piece")));
        busNum.setNumNo((String) body.get("numNo"));
        Map<String,Object> map = new HashMap<>();
        try {
            busNumService.updateBusNum(busNum);
            map.put("msg","修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg","修改失败");
        }
        return map;
    }
}
