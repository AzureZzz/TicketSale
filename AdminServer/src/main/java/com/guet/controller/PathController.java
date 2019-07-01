package com.guet.controller;

import com.guet.annotation.AuthLogin;
import com.guet.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class PathController {

    @Autowired
    private IBusTicketService busTicketService;

    @Autowired
    private IBusBillService busBillService;

    @Autowired
    private ITrainTicketService trainTicketService;

    @Autowired
    private ITrainBillService trainBillService;

    @Autowired
    private IUserService userService;

    @Autowired
    private ILateTrainService lateTrainService;

    @Autowired
    private IAdminService adminService;

    @AuthLogin
    @RequestMapping(value = "index",method = RequestMethod.GET)
    public ModelAndView toIndex(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("index");
        Long aId = (Long) request.getSession().getAttribute("aId");
        try {
            modelAndView.addObject("busReCount",busTicketService.getRemainCount());
            modelAndView.addObject("trainReCount",trainTicketService.getRemainCount());
            modelAndView.addObject("userAllCount",userService.getAllCount());
            modelAndView.addObject("trainTicketAllCount",trainTicketService.getAllCount());
            modelAndView.addObject("busTicketAllCount",busTicketService.getAllCount());
            modelAndView.addObject("lateTrainAllCount",lateTrainService.getAllCount());
            modelAndView.addObject("admin",adminService.getAdminInfo(aId));
            modelAndView.addObject("trainBillSale",trainBillService.getWeekCount());
            modelAndView.addObject("busBillSale",busBillService.getWeekCount());
            List<Integer> saleScale = new ArrayList<>();
            saleScale.add(busTicketService.getSaleCount());
            saleScale.add(trainTicketService.getSaleCount());
            modelAndView.addObject("saleScale",saleScale);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @RequestMapping(value = "login",method = RequestMethod.GET)
    public String toLogin(){
        return "login";
    }

    @AuthLogin
    @RequestMapping(value = "bus/num",method = RequestMethod.GET)
    public ModelAndView toNumBus(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("num_bus");
        Long aId = (Long) request.getSession().getAttribute("aId");
        try {
            modelAndView.addObject("admin",adminService.getAdminInfo(aId));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @AuthLogin
    @RequestMapping(value = "train/num",method = RequestMethod.GET)
    public ModelAndView toTrainNum(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("num_train");
        Long aId = (Long) request.getSession().getAttribute("aId");
        try {
            modelAndView.addObject("admin",adminService.getAdminInfo(aId));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @AuthLogin
    @RequestMapping(value = "bus/sale",method = RequestMethod.GET)
    public ModelAndView toSaleBus(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("sale_bus");
        Long aId = (Long) request.getSession().getAttribute("aId");
        try {
            modelAndView.addObject("admin",adminService.getAdminInfo(aId));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @AuthLogin
    @RequestMapping(value = "train/sale",method = RequestMethod.GET)
    public ModelAndView toSaleTrain(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("sale_train");
        Long aId = (Long) request.getSession().getAttribute("aId");
        try {
            modelAndView.addObject("admin",adminService.getAdminInfo(aId));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @AuthLogin
    @RequestMapping(value = "stuAuth",method = RequestMethod.GET)
    public ModelAndView toStuAuth(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("stu_auth");
        Long aId = (Long) request.getSession().getAttribute("aId");
        try {
            modelAndView.addObject("admin",adminService.getAdminInfo(aId));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @AuthLogin
    @RequestMapping(value = "bus/ticket",method = RequestMethod.GET)
    public ModelAndView toticketBus(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("ticket_bus");
        Long aId = (Long) request.getSession().getAttribute("aId");
        try {
            modelAndView.addObject("remainCount",busTicketService.getRemainCount());
            modelAndView.addObject("admin",adminService.getAdminInfo(aId));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @AuthLogin
    @RequestMapping(value = "train/ticket",method = RequestMethod.GET)
    public ModelAndView toTicketTrain(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("ticket_train");
        Long aId = (Long) request.getSession().getAttribute("aId");
        try {
            modelAndView.addObject("remainCount",trainTicketService.getRemainCount());
            modelAndView.addObject("admin",adminService.getAdminInfo(aId));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @AuthLogin
    @RequestMapping(value = "train/late",method = RequestMethod.GET)
    public ModelAndView toLateTrain(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("train_late");
        Long aId = (Long) request.getSession().getAttribute("aId");
        try {
            modelAndView.addObject("admin",adminService.getAdminInfo(aId));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @AuthLogin
    @RequestMapping(value = "user/info",method = RequestMethod.GET)
    public ModelAndView toUserInfo(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("user_info");
        Long aId = (Long) request.getSession().getAttribute("aId");
        try {
            modelAndView.addObject("admin",adminService.getAdminInfo(aId));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @AuthLogin
    @RequestMapping(value = "user/ticket",method = RequestMethod.GET)
    public ModelAndView toUserTicket(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("user_ticket");
        Long aId = (Long) request.getSession().getAttribute("aId");
        try {
            modelAndView.addObject("admin",adminService.getAdminInfo(aId));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

}
