package com.guet.controller;

import com.guet.entity.TrainTicket;
import com.guet.service.ITrainTicketServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TrainTicketController {

    @Autowired
    private ITrainTicketServer trainTicketServer;

    @RequestMapping(value = "trainTicket/info",method = RequestMethod.GET)
    public ModelAndView queryTrainTickets(@RequestParam String startPlace,
                                          @RequestParam String desPlace,
                                          @RequestParam String goOff,
                                          @RequestParam Long tbId){
        String sPlace = startPlace.substring(0,startPlace.length()-1);
        String dPlace = desPlace.substring(0,desPlace.length()-1);
        ModelAndView modelAndView = new ModelAndView("query_train_ticket");
        try {
            List<TrainTicket> trainTickets = trainTicketServer.getTrainTicketByInfo(sPlace,dPlace,goOff);
            modelAndView.addObject("startPlace",startPlace);
            modelAndView.addObject("desPlace",desPlace);
            modelAndView.addObject("goOff",goOff);
            modelAndView.addObject("trainTickets",trainTickets);
            modelAndView.addObject("tbId",tbId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }
}
