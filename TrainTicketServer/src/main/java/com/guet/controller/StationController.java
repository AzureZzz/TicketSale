package com.guet.controller;

import com.guet.entity.Station;
import com.guet.service.IStationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class StationController {

    @Autowired
    private IStationService stationService;

    @RequestMapping(value = "station/info",method = RequestMethod.GET)
    public ModelAndView queryStationByInfo(@RequestParam String city){
        ModelAndView modelAndView = new ModelAndView("query_train_station");
        String c = city.substring(0,city.length()-1);
        try {
            List<Station> stations = stationService.getStationByInfo(c);
            modelAndView.addObject("city",city);
            modelAndView.addObject("stations",stations);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @RequestMapping(value = "station/name",method = RequestMethod.GET)
    public ModelAndView queryStationByName(@RequestParam String name){
        ModelAndView modelAndView = new ModelAndView("query_train_station");
        try {
            List<Station> stations = new ArrayList<>();
            stations.add(stationService.getStationByName(name));
            modelAndView.addObject("name",name);
            modelAndView.addObject("stations",stations);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

}
