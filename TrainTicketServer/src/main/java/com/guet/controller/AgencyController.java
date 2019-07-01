package com.guet.controller;

import com.guet.entity.Agency;
import com.guet.service.IAgencyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class AgencyController {

    @Autowired
    private IAgencyService agencyService;

    @RequestMapping(value = "agency/city",method = RequestMethod.GET)
    public ModelAndView queryAgencyByCity(@RequestParam String city){
        ModelAndView modelAndView = new ModelAndView("query_agency");
        String c = city.substring(0,city.length()-1);
        try {
            List<Agency> agencies = agencyService.getAgencyByInfo(c);
            modelAndView.addObject("city",city);
            modelAndView.addObject("agencies",agencies);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @RequestMapping(value = "agency/name",method = RequestMethod.GET)
    public ModelAndView queryAgencyByName(@RequestParam String name){
        ModelAndView modelAndView = new ModelAndView("query_agency");
        try {
            List<Agency> agencies = new ArrayList<>();
            agencies.add(agencyService.getAgencyByName(name));
            modelAndView.addObject("name",name);
            modelAndView.addObject("agencies",agencies);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }
}
