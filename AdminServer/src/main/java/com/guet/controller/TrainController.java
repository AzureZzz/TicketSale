package com.guet.controller;

import com.guet.annotation.AuthLogin;
import com.guet.entity.*;
import com.guet.service.IBusNumService;
import com.guet.service.ITrainBillService;
import com.guet.service.ITrainNumService;
import com.guet.service.ITrainTicketService;
import com.guet.utils.LayUITableUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TrainController {

    @Autowired
    private ITrainBillService trainBillService;

    @Autowired
    private ITrainTicketService trainTicketService;

    @Autowired
    private ITrainNumService trainNumService;

    @Autowired
    private LayUITableUtils<TrainBill> layUITrainBill;

    @Autowired
    private LayUITableUtils<TrainTicketInfo> layUITrainTicket;

    @Autowired
    private LayUITableUtils<TrainNum> layUITrainNum;

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "trainBill/today",method = RequestMethod.GET)
    public Map<String,Object> queryTrainBillsToday(@RequestParam Integer page, @RequestParam Integer limit){
        Map<String,Object> map = null;
        try {
            map = layUITrainBill.getLayUIMap(trainBillService.getTodaySale(page,limit),trainBillService.getTodayCount());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "trainBill/user",method = RequestMethod.GET)
    public Map<String,Object> queryTrainBillsUser(@RequestParam Integer page, @RequestParam Integer limit,
                                                  @RequestParam String key){
        Map<String,Object> map = null;
        try {
            map = layUITrainBill.getLayUIMap(trainBillService.getUserTrainBill(page,limit,key),trainBillService.getUserTrainBillCount(key));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "trainTicket/remain",method = RequestMethod.POST)
    public Map<String,Object> addRemainTrainTicket(@RequestBody Map<String,Object> body){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        TrainTicket trainTicket = new TrainTicket();
        TrainNum trainNum = new TrainNum();
        trainNum.setTrainNo((String) body.get("trainNo"));
        trainTicket.setTrainNum(trainNum);
        trainTicket.setStartStation((String) body.get("startStation"));
        trainTicket.setDesStation((String) body.get("desStation"));
        try {
            trainTicket.setArriveTime(simpleDateFormat.parse((String) body.get("arriveTime")));
            trainTicket.setGoOff(simpleDateFormat.parse((String) body.get("goOff")));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        TrainSeat trainSeat = new TrainSeat();
        trainSeat.setSeatType((String) body.get("seatType"));
        trainSeat.setSeatNo((String) body.get("trainNo"));
        trainSeat.setPiece(Float.valueOf((String) body.get("piece")));
        Map<String,Object> map = new HashMap<>();
        try {
            trainTicketService.addTrainTicket(trainTicket,trainSeat);
            map.put("msg","删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","删除失败！");
        }
        return map;
    }

//    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "trainTicket/remain",method = RequestMethod.GET)
    public Map<String,Object> queryRemainTrainTicket(@RequestParam Integer page, @RequestParam Integer limit){
        Map<String,Object> map = null;
        try {
            map = layUITrainTicket.getLayUIMap(trainTicketService.getRemainTrainTicket(page,limit),trainTicketService.getRemainCount());
            System.out.println(map.get("count"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "trainTicket/remain/{tsId}",method = RequestMethod.DELETE)
    public Map<String,Object> deleteRemainTrainTicket(@PathVariable("tsId") Long tsId){
        Map<String,Object> map = new HashMap<>();
        try {
            trainTicketService.deleteTrainTicket(tsId);
            map.put("msg","删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","删除失败！");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "trainTicket/remain",method = RequestMethod.DELETE)
    public Map<String,Object> deleteRemainTrainTickets(@RequestBody Map<String,Object> body){
        List<Integer> ids = (List<Integer>) body.get("ids");
        Map<String,Object> map = new HashMap<>();
        try {
            for (Integer tsId: ids) {
                trainTicketService.deleteTrainTicket(Long.valueOf(tsId+""));
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
    @RequestMapping(value = "trainTicket/remain",method = RequestMethod.PUT)
    public Map<String,Object> updateRemainTrainTicket(@RequestBody Map<String,Object> body){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        TrainTicket trainTicket = new TrainTicket();
        try {
            trainTicket.setArriveTime(simpleDateFormat.parse((String) body.get("arriveTime")));
            trainTicket.setGoOff(simpleDateFormat.parse((String) body.get("goOff")));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        trainTicket.setStartStation((String) body.get("startStation"));
        trainTicket.setDesStation((String) body.get("desStation"));
        TrainNum trainNum = new TrainNum();
        trainNum.setTrainNo((String) body.get("trainNo"));
        trainTicket.setTrainNum(trainNum);
        TrainSeat trainSeat = new TrainSeat();
        System.out.println((String) body.get("tsId"));
        trainSeat.setTsId(Long.valueOf((String) body.get("tsId")));
        trainSeat.setSeatType((String) body.get("seatType"));
        trainSeat.setPiece(Float.valueOf((String) body.get("piece")));
        Map<String,Object> map = new HashMap<>();
        try {
            trainTicketService.updateTrainTicket(trainSeat,trainTicket);
            map.put("msg","修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","修改失败！");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "trainTicket/sale",method = RequestMethod.GET)
    public Map<String,Object> querySaleTrainTicket(@RequestParam Integer page, @RequestParam Integer limit){
        Map<String,Object> map = null;
        try {
            map = layUITrainTicket.getLayUIMap(trainTicketService.getSaleTrainTicket(page,limit),trainTicketService.getSaleCount());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "trainNum/station",method = RequestMethod.GET)
    public Map<String,Object> queryTrainNum(@RequestParam Integer page, @RequestParam Integer limit,
                                          @RequestParam String key){
        Map<String,Object> map = null;
        try {
            map = layUITrainNum.getLayUIMap(trainNumService.getTrainNumByStation(page,limit,key),trainNumService.getTrainNumCountByStation(key));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "trainNum",method = RequestMethod.POST)
    public Map<String,Object> addTrainNum(@RequestBody Map<String,Object> body){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        TrainNum trainNum = new TrainNum();
        trainNum.setStartStation((String) body.get("startStation"));
        trainNum.setDesStation((String) body.get("desStation"));
        try {
            trainNum.setGoOff(simpleDateFormat.parse((String) body.get("goOff")));
            trainNum.setArrive(simpleDateFormat.parse((String) body.get("arrive")));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        trainNum.setTrainNo((String) body.get("trainNo"));
        Map<String,Object> map = new HashMap<>();
        try {
            trainNumService.addTrainNum(trainNum);
            map.put("msg","添加成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","添加失败");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "trainNum",method = RequestMethod.PUT)
    public Map<String,Object> updateTrainNum(@RequestBody Map<String,Object> body){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        TrainNum trainNum = new TrainNum();
        trainNum.setStartStation((String) body.get("startStation"));
        trainNum.setDesStation((String) body.get("desStation"));
        try {
            trainNum.setGoOff(simpleDateFormat.parse((String) body.get("goOff")));
            trainNum.setArrive(simpleDateFormat.parse((String) body.get("arrive")));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        trainNum.setTrainNo((String) body.get("trainNo"));
        Map<String,Object> map = new HashMap<>();
        try {
            trainNumService.updateTrainNum(trainNum);
            map.put("msg","修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","修改失败");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "trainNum",method = RequestMethod.DELETE)
    public Map<String,Object> deleteTrainNum(@RequestBody Map<String,Object> body){
        String trainNo = (String) body.get("trainNo");
        Map<String,Object> map = new HashMap<>();
        try {
            trainNumService.deleteTrainNum(trainNo);
            map.put("msg","删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","删除失败");
        }
        return map;
    }

    @RequestMapping(value = "/trainTickets",method = RequestMethod.POST)
    public ResponseEntity addTrainTicket(){
        return null;
    }
    @RequestMapping(value = "/trainTicket/{id}",method = RequestMethod.GET)
    public ResponseEntity getTrainTicket(){
        return null;
    }
    @RequestMapping(value = "/trainTicket/{id}",method = RequestMethod.DELETE)
    public ResponseEntity deleteTrainTicket(){
        return null;
    }
    @RequestMapping(value = "/trainTicket",method = RequestMethod.PUT)
    public ResponseEntity updateTrainTicket(){
        return null;
    }


}
