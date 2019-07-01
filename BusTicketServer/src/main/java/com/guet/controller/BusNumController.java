package com.guet.controller;

import com.guet.entity.BusNum;
import com.guet.service.IBusNumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class BusNumController {

    @Autowired
    private IBusNumService busNumService;

    @RequestMapping(value = "busTicket/info",method = RequestMethod.GET)
    public ModelAndView queryBusTicketByInfo(@RequestParam String startCity, @RequestParam String arriveCity,
                                             @RequestParam String goOff,
                                             @RequestParam Long bbId){
        String startCity1 = startCity.substring(0,startCity.length()-1);
        String arriveCity1 = arriveCity.substring(0,arriveCity.length()-1);
        ModelAndView modelAndView = new ModelAndView("query_bus_ticket");
        try {
            List<BusNum> busNums =  busNumService.getBusTicketsByInfo(startCity1,arriveCity1,goOff);
            modelAndView.addObject("busNums",busNums);
            modelAndView.addObject("startCity",startCity);
            modelAndView.addObject("arriveCity",arriveCity);
            modelAndView.addObject("goOff",goOff);
            modelAndView.addObject("bbId",bbId);
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView.addObject("busTickets",null);
        }
        return modelAndView;
    }

    @RequestMapping(value = "busNum/info",method = RequestMethod.GET)
    public ModelAndView queryNumByInfo(@RequestParam String startCity, @RequestParam String arriveCity,
                                             @RequestParam String goOff){
        String startCity1 = startCity.substring(0,startCity.length()-1);
        String arriveCity1 = arriveCity.substring(0,arriveCity.length()-1);
        ModelAndView modelAndView = new ModelAndView("query_bus_num");
        try {
            List<BusNum> busNums =  busNumService.getBusNumByInfo(startCity1,arriveCity1,goOff);
            modelAndView.addObject("startCity",startCity);
            modelAndView.addObject("arriveCity",arriveCity);
            modelAndView.addObject("busNums",busNums);
            modelAndView.addObject("goOff",goOff);
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView.addObject("busTickets",null);
        }
        return modelAndView;
    }

    @RequestMapping(value = "busticket",method = RequestMethod.GET)
    public ModelAndView getBusBills(@RequestParam String startCity, @RequestParam String arriveCity,
                                    @RequestParam String goOff){
        SimpleDateFormat sdf =   new SimpleDateFormat( "MM/dd/yyyy" );
        Date date =null;
        try {
             date = sdf.parse( goOff );
        } catch (ParseException e) {
            e.printStackTrace();
        }
        startCity = startCity.substring(0,startCity.length()-1);
        arriveCity = arriveCity.substring(0,arriveCity.length()-1);
        System.out.println(goOff);
        ModelAndView modelAndView = new ModelAndView("query_bus_tickets");
        List<BusNum> tickets = null;
        try {
            tickets = busNumService.getBusTicketsByInfo(startCity,arriveCity,goOff);
        } catch (Exception e) {
            e.printStackTrace();
        }
        modelAndView.addObject("bustickets",tickets);
        return modelAndView;
    }
    @RequestMapping(value = "busticket/1",method = RequestMethod.GET)
    public ResponseEntity getBusBillsTest(@RequestParam String startCity, @RequestParam String arriveCity,
                                          @RequestParam String goOff){
        startCity = startCity.substring(0,startCity.length()-1);
        arriveCity = arriveCity.substring(0,arriveCity.length()-1);
        System.out.println(goOff);
        List<BusNum> tickets = null;
        try {
            tickets = busNumService.getBusTicketsByInfo(startCity,arriveCity,goOff);
            return new ResponseEntity(tickets,HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ResponseEntity(HttpStatus.NOT_FOUND);
    }
}
