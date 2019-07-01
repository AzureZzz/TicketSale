package com.guet.controller;

import com.guet.annotation.AuthLogin;
import com.guet.entity.LateTrain;
import com.guet.service.ILateTrainService;
import com.guet.utils.LayUITableUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
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
public class LateTrainController {

    @Autowired
    private ILateTrainService lateTrainService;

    @Autowired
    private LayUITableUtils<LateTrain> layUILateTrain;

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "latetrain",method = RequestMethod.GET)
    public Map<String,Object> getLateTrains(@RequestParam Integer page,@RequestParam Integer limit,
                                            @RequestParam String keyWord){
        Map<String ,Object> map = new HashMap<>();
        try {
            map = layUILateTrain.getLayUIMap(lateTrainService.getAll(page,limit,null,null),lateTrainService.getAllCount());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "latetrain/{id}",method = RequestMethod.DELETE)
    public Map<String ,Object> deleteLateTrain(@PathVariable("id") Long ltId){
        Map<String ,Object> map = new HashMap<>();
        try {
            lateTrainService.deleteLateTrain(ltId);
            map.put("msg","删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","删除失败");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "latetrain",method = RequestMethod.DELETE)
    public Map<String ,Object> deleteLateTrains(@RequestBody Map<String,Object> requestParam){
        List<Integer> ids = (List<Integer>) requestParam.get("ids");
        Map<String ,Object> map = new HashMap<>();
        try {
            for (Integer id:ids) {
                lateTrainService.deleteLateTrain(Long.valueOf(id+""));
            }
            map.put("msg","删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","删除失败");
        }
        return map;
    }



    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "latetrain",method = RequestMethod.POST)
    public Map<String ,Object> addLateTrain(@RequestBody Map<String,Object> body){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
        String startStation = (String) body.get("startStation");
        String desStation = (String) body.get("desStation");
        String trainNo = (String)body.get("trainNo");
        LateTrain lateTrain = new LateTrain();
        Date date = null;
        lateTrain.setType(Boolean.valueOf((String) body.get("type")));
        try {
            lateTrain.setNewTime(simpleDateFormat.parse((String) body.get("newTime")));
            date = simpleDateFormat.parse((String) body.get("goOff"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Map<String ,Object> map = new HashMap<>();
        try {
            lateTrainService.addLateTrain(lateTrain,startStation,desStation,trainNo,simpleDateFormat1.format(date));
            map.put("msg","添加成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","添加失败");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "latetrain",method = RequestMethod.PUT)
    public Map<String ,Object> updateLateTrain(@RequestBody Map<String,Object> body){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        LateTrain lateTrain = new LateTrain();
        lateTrain.setLtId(Long.valueOf((String) body.get("ltId")));
        if(((String) body.get("type")).equals("1")){
            lateTrain.setType(true);
        }else{
            lateTrain.setType(false);
        }
        try {
            lateTrain.setNewTime(simpleDateFormat.parse((String) body.get("newTime")));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Map<String ,Object> map = new HashMap<>();
        try {
            lateTrainService.updateLateTrain(lateTrain);
            map.put("msg","修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","修改失败");
        }
        return map;
    }
}
