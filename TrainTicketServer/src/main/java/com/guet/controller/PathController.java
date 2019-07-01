package com.guet.controller;

import com.guet.annotation.AuthLogin;
import com.guet.entity.*;
import com.guet.service.IArticalService;
import com.guet.service.IPassengerService;
import com.guet.service.ITrainSeatService;
import com.guet.service.ITrainTicketServer;
import com.guet.utils.ServiceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class PathController{

    @Autowired
    private ITrainSeatService trainSeatService;

    @Autowired
    private ITrainTicketServer trainTicketServer;

    @Autowired
    private IPassengerService passengerService;

    @Autowired
    private IArticalService articalService;

    @RequestMapping(value = "trainTicket",method = RequestMethod.GET)
    public ModelAndView toQueryTrainTicket(){
        ModelAndView modelAndView = new ModelAndView("query_train_ticket");
        try {
            List<Artical> articals = articalService.getArticals();
            modelAndView.addObject("articals",articals);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @AuthLogin
    @RequestMapping(value = "changeTrainTicket",method = RequestMethod.GET)
    public ModelAndView toQueryTrainTicket(@RequestParam Long tbId){
        ModelAndView modelAndView = new ModelAndView("query_train_ticket");
        modelAndView.addObject("tbId",tbId);
        return modelAndView;
    }

    @RequestMapping(value = "trainNum",method = RequestMethod.GET)
    public String toQueryTrainNum(){
        return "query_train_num";
    }

    @RequestMapping(value = "trainStation",method = RequestMethod.GET)
    public String toQueryTrainStation(){
        return "query_train_station";
    }

    @RequestMapping(value = "trainLate",method = RequestMethod.GET)
    public String toQueryTrainLate(){
        return "query_train_late";
    }

    @RequestMapping(value = "agency",method = RequestMethod.GET)
    public String toQueryAgency(){
        return "query_agency";
    }

    @AuthLogin
    @RequestMapping(value = "trainBill/{ttId}",method = RequestMethod.GET)
    public ModelAndView toAddTicketBill(@PathVariable("ttId") Long ttId,
                                        @RequestParam("seatType") String seatType,
                                        HttpServletRequest request,
                                        @RequestParam Long tbId){
        ModelAndView modelAndView = new ModelAndView("add_ticket_bill");
        Long uId = ServiceUtils.getUid(request);
        try {
            List<TrainSeat> trainSeats =  trainSeatService.getTrainSeats(ttId,seatType);
            List<Passenger> passengers = passengerService.getUserPassenger(uId);
            TrainTicket trainTicket = trainTicketServer.getTrainTicketById(ttId);
            modelAndView.addObject("trainSeats",trainSeats);
            modelAndView.addObject("trainTicket",trainTicket);
            modelAndView.addObject("seatType",seatType);
            modelAndView.addObject("passengers",passengers);
            modelAndView.addObject("tbId",tbId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }
}
