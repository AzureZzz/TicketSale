package com.guet.controller;

import com.guet.entity.TrainNum;
import com.guet.service.ITrainNumServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;


@Controller
public class TrainNumController {

    @Autowired
    private ITrainNumServer trainNumServer;

    @RequestMapping(value = "trainNum/info",method = RequestMethod.GET)
    public ModelAndView queryTrainNumByInfo(@RequestParam String goOff,
                                            @RequestParam String startStation){
        ModelAndView modelAndView = new ModelAndView("query_train_num");
        try {
            List<TrainNum> trainNums = trainNumServer.getTrainNumByInfo(startStation,goOff);
            modelAndView.addObject("goOff",goOff);
            modelAndView.addObject("startStation",startStation);
            modelAndView.addObject("trainNums",trainNums);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @RequestMapping(value = "trainNum/no",method = RequestMethod.GET)
    public ModelAndView queryTrainNumByNo(@RequestParam String goOff,
                                            @RequestParam String trainNo){
        ModelAndView modelAndView = new ModelAndView("query_train_num");
        try {
            TrainNum trainNum = trainNumServer.getTrainNumByNo(trainNo,goOff);
            List<TrainNum> trainNums = new ArrayList<>();
            trainNums.add(trainNum);
            modelAndView.addObject("goOff2",goOff);
            modelAndView.addObject("trainNo",trainNo);
            modelAndView.addObject("trainNums",trainNums);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }
}
