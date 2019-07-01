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

    @RequestMapping(value = "busStation/info",method = RequestMethod.GET)
    public ModelAndView queryBusStationByInfo(@RequestParam String city){
        ModelAndView modelAndView = new ModelAndView("query_bus_station");
        modelAndView.addObject("city",city);
        try {
            List<Station> stations = stationService.getStationsByInfo(city.substring(0,city.length()-1));
            modelAndView.addObject("stations",stations);
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView.addObject("stations",null);
        }
        return modelAndView;
    }

    @RequestMapping(value = "busStation/name",method = RequestMethod.GET)
    public ModelAndView queryBusStationByName(@RequestParam String name){
        ModelAndView modelAndView = new ModelAndView("query_bus_station");
        modelAndView.addObject("name",name);
        try {
            Station station = stationService.getStationByName(name);
            List<Station> stations = new ArrayList<>();
            stations.add(station);
            modelAndView.addObject("stations",stations);
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView.addObject("stations",null);
        }
        return modelAndView;
    }
}
