package com.guet.controller;

import com.guet.annotation.AuthLogin;
import com.guet.entity.Artical;
import com.guet.entity.BusNum;
import com.guet.entity.Passenger;
import com.guet.entity.UserBase;
import com.guet.service.IArticalService;
import com.guet.service.IBusNumService;
import com.guet.service.IPassengerService;
import com.guet.service.IUserService;
import com.guet.utils.ServiceUtils;
import com.guet.utils.VerifyCodeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class PathController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IPassengerService passengerService;

    @Autowired
    private IBusNumService busNumService;

    @Autowired
    private IArticalService articalService;

//    @RequestMapping(value = "authIdCard",method = RequestMethod.GET)
//    public Map<String,Object> authIdCard(@RequestBody Map<String,Object> body){
//        Map<String,Object> map = new HashMap<>();
//        String host = "http://idcard.market.alicloudapi.com";
//        String path = "/lianzhuo/idcard";
//        String method = "GET";
//        String appcode = "360d7d3cb1244b66b3c2075c77cf03db";
//        Map<String, String> headers = new HashMap<>();
//        headers.put("Authorization", "APPCODE " + appcode);
//        Map<String, String> querys = new HashMap<>();
//        querys.put("cardno", (String) body.get("idCard"));
//        querys.put("name", (String) body.get("realName"));
//
//        try {
//
//            HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
//            System.out.println(response.toString());
//            map.put("data",response.getEntity());
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return map;
//    }

    @RequestMapping(value = "code",method = RequestMethod.GET)
    public void getCode(HttpServletRequest request,
                        HttpServletResponse response){
        HttpSession session = request.getSession();
        int w = 95, h = 38;
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
        session.removeAttribute("code");
        session.setAttribute("code",verifyCode);
        try {
            VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "artical/{id}",method = RequestMethod.GET)
    public ModelAndView toArtical(@PathVariable("id")Long id){
        ModelAndView modelAndView = new ModelAndView("artical");
        try {
            Artical artical = articalService.getArtical(id);
            modelAndView.addObject("artical",artical);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @RequestMapping(value = "login",method = RequestMethod.GET)
    public String toLogin(){
        return "login";
    }

    @RequestMapping(value = "signup",method = RequestMethod.GET)
    public String toSignup(){
        return "signup";
    }

    @RequestMapping(value = "index",method = RequestMethod.GET)
    public String toIndex(){
        return "index";
    }

    @RequestMapping(value = "busTicket",method = RequestMethod.GET)
    public ModelAndView toQueryBusTicket(){
        ModelAndView modelAndView = new ModelAndView("query_bus_ticket");
        try {
            List<Artical> articals = articalService.getArticals();
            modelAndView.addObject("articals",articals);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @AuthLogin
    @RequestMapping(value = "changeBusTicket",method = RequestMethod.GET)
    public ModelAndView toQueryBusTicket(@RequestParam Long bbId){
        ModelAndView modelAndView = new ModelAndView("query_bus_ticket");
        modelAndView.addObject("bbId",bbId);
        return modelAndView;
    }

    @RequestMapping(value = "busStation",method = RequestMethod.GET)
    public String toQueryBusStation(){
        return "query_bus_station";
    }

    @RequestMapping(value = "busNum",method = RequestMethod.GET)
    public String toQueryBusNum(){
        return "query_bus_num";
    }

    @RequestMapping(value = "busBill",method = RequestMethod.GET)
    public ModelAndView toAddTicketBill(){
        ModelAndView modelAndView = new ModelAndView("add_ticket_bill");
        return modelAndView;
    }

    @AuthLogin
    @RequestMapping(value = "busBill/{bId}",method = RequestMethod.GET)
    public ModelAndView toAddTicketBill(@PathVariable("bId")Long bId,HttpServletRequest request,
                                        @RequestParam Long bbId){
        ModelAndView modelAndView = new ModelAndView("add_ticket_bill");
        Long uId = ServiceUtils.getUid(request);
        try {
            List<Passenger> passengers = passengerService.getUserPassenger(uId);
            BusNum busNum = busNumService.getBusNumById(bId);
            modelAndView.addObject("busNum",busNum);
            modelAndView.addObject("passengers",passengers);
            modelAndView.addObject("bbId",bbId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @AuthLogin
    @RequestMapping(value = "userBusBill",method = RequestMethod.GET)
    public ModelAndView toUserBillBus(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("user_bill_bus");
        return addBaseInfo(modelAndView,request);
    }

    @AuthLogin
    @RequestMapping(value = "userTrainBill",method = RequestMethod.GET)
    public ModelAndView toUserBillTrain(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("user_bill_train");
        return addBaseInfo(modelAndView,request);
    }

    @AuthLogin
    @RequestMapping(value = "userInfo",method = RequestMethod.GET)
    public ModelAndView toUserInfo(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("user_info");
        Long uId = ServiceUtils.getUid(request);
        try {
            modelAndView.addObject("userInfo",userService.getOtherInfo(uId));
            modelAndView.addObject("stuAuth",userService.getStuInfo(uId));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return addBaseInfo(modelAndView,request);
    }

    @AuthLogin
    @RequestMapping(value = "userPassenger",method = RequestMethod.GET)
    public ModelAndView toUserPassenger(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("user_passenger");
        return addBaseInfo(modelAndView,request);
    }

    @AuthLogin
    @RequestMapping(value = "userSafe",method = RequestMethod.GET)
    public ModelAndView toUserSafe(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("user_safe");
        return addBaseInfo(modelAndView,request);
    }


    /**
     * 返回视图增加userBase信息
     * @param modelAndView
     * @param request
     * @return
     */
    public ModelAndView addBaseInfo(ModelAndView modelAndView,HttpServletRequest request){
        try {
            UserBase userBase = userService.getBaseInfo(ServiceUtils.getUid(request));
            modelAndView.addObject("userBase",userBase);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

}
