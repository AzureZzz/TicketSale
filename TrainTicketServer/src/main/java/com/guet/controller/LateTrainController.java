package com.guet.controller;

import com.guet.entity.LateInfo;
import com.guet.service.ILateTrainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
public class LateTrainController {

    @Autowired
    private ILateTrainService lateTrainService;

    @RequestMapping(value = "latetrain",method = RequestMethod.GET)
    public ModelAndView queryLateTrain(@RequestParam String station,
                                       @RequestParam String trainNo,
                                       @RequestParam String type){
        ModelAndView modelAndView = new ModelAndView("query_train_late");
        modelAndView.addObject("station",station);
        modelAndView.addObject("trainNo",trainNo);
        try {
            LateInfo lateInfo = null;
            if(type.equals("出发站")){
                lateInfo = lateTrainService.getLateTrainStart(station,trainNo,true);
                modelAndView.addObject("type",true);
            }else{
                lateInfo = lateTrainService.getLateTrainStart(station,trainNo,false);
                modelAndView.addObject("type",false);
            }
            modelAndView.addObject("lateInfo",lateInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }
}
