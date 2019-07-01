package com.guet.controller;

import com.guet.annotation.AuthLogin;
import com.guet.entity.StuAuth;
import com.guet.entity.UserBase;
import com.guet.entity.UserInfo;
import com.guet.service.IStuAuthService;
import com.guet.service.IUserService;
import com.guet.utils.ServiceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Controller
public class UserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IStuAuthService stuAuthService;

    @Autowired
    private RedisTemplate<String, Serializable> redis;

    @ResponseBody
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public Map<String,Object> login(@RequestBody Map<String,String> body,
                                HttpServletRequest request,
                                HttpServletResponse response) {
        Map<String, Object> result = new HashMap<>();
        String realCode = (String) request.getSession().getAttribute("code");
        System.out.println(realCode);
        String code = body.get("code").toUpperCase();
        System.out.println(code);
        if(!realCode.equals(code)){
            result.put("err", "验证码错误！");
            return result;
        }
        String username = body.get("username").trim();
        String password = body.get("password").trim();
        if ("".equals(username) || "".equals(password)) {
            result.put("err", "用户名或密码不能为空");
            return result;
        }
        try {
            UserBase userBase = userService.login(username, password);
            if (userBase == null) {
                result.put("err", "用户名或密码错误!");
                return result;
            }
            Long uId = ServiceUtils.getUid(request);
            if(uId == userBase.getuId() && redis.boundValueOps(userBase.getuId()+"").get()!=null){
                result.put("err", "请勿重复登陆!");
                return result;
            }
            redis.boundValueOps(userBase.getuId()+"").set(userBase.getuId(), 2, TimeUnit.HOURS);
            System.out.println(userBase.getuId());
            Cookie tokenCookie=new Cookie("token",userBase.getuId()+"");
            tokenCookie.setMaxAge(2*60*60);
            tokenCookie.setPath("/");
            response.addCookie(tokenCookie);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            result.put("err", "登录失败!");
            return result;
        }
    }

    @ResponseBody
    @RequestMapping(value = "signup/adult", method = RequestMethod.POST)
    public Map<String,Object> signupAdult(@RequestBody UserBase userBase) {
        Map<String,Object> map = new HashMap<>();
        try {
            if(userService.getUserBaseByUsername(userBase.getUsername())!=null){
                map.put("err","用户名已被注册");
                return map;
            }
            if(userService.getUserBaseByEmail(userBase.getEmail())!=null){
                map.put("err","邮箱已被注册");
                return map;
            }
            if(userService.getUserBaseByIdCard(userBase.getIdCard())!=null){
                map.put("err","用户信息已被注册");
                return map;
            }
            if(userService.getUserBaseByPhoneNumber(userBase.getPhoneNumber())!=null){
                map.put("err","手机号已被注册");
                return map;
            }
            System.out.println(userBase.getPhoneNumber());
            Long id = userService.signup(userBase);
            map.put("id",id);
            map.put("msg","注册成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","注册失败");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "signup/student", method = RequestMethod.POST)
    public Map<String,Object> signupStudent(@RequestBody Map<String,Object> body) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        UserBase userBase = new UserBase();
        StuAuth stuAuth = new StuAuth();
        userBase.setUsername((String) body.get("username"));
        userBase.setPassword((String) body.get("password"));
        userBase.setRealName((String) body.get("realName"));
        userBase.setIdCardType((String) body.get("idCardType"));
        userBase.setIdCard((String) body.get("idCard"));
        userBase.setEmail((String) body.get("email"));
        userBase.setPhoneNumber((String) body.get("phoneNumber"));
        userBase.setUserType((String) body.get("userType"));
        stuAuth.setProvince((String) body.get("province"));
        stuAuth.setSchool((String) body.get("school"));
        stuAuth.setDepartment((String) body.get("department"));
        stuAuth.setStuClass((String) body.get("stuClass"));
        stuAuth.setStuNo((String) body.get("stuNo"));
        stuAuth.setStuLen(Short.parseShort((String) body.get("stuLen")));
        try {
            stuAuth.setJoinYear(simpleDateFormat.parse((String) body.get("joinYear")));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Map<String,Object> map = new HashMap<>();
        try {
            if(userService.getUserBaseByUsername(userBase.getUsername())!=null){
                map.put("err","用户名已被注册");
                return map;
            }
            if(userService.getUserBaseByEmail(userBase.getEmail())!=null){
                map.put("err","邮箱已被注册");
                return map;
            }
            if(userService.getUserBaseByIdCard(userBase.getIdCard())!=null){
                map.put("err","用户信息已被注册");
                return map;
            }
            if(userService.getUserBaseByPhoneNumber(userBase.getPhoneNumber())!=null){
                map.put("err","手机号已被注册");
                return map;
            }
            Long id = userService.signupStu(userBase,stuAuth);
            map.put("id",id);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","注册失败");
        }
        return map;
    }

    @AuthLogin
    @RequestMapping(value = "logout")
    public void logout(HttpServletRequest request,HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie:cookies) {
            if(cookie.getName().equals("token")){
                redis.delete(cookie.getValue() + "");
            }
        }
        Cookie cookie = new Cookie("token",null);   //删除cookies中的token
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);
        try {
            response.sendRedirect("/index");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "userinfo",method = RequestMethod.PUT)
    public Map<String,Object> modifyUserInfo(@RequestBody UserInfo userInfo,
                                             HttpServletRequest request){
        Long uId = ServiceUtils.getUid(request);
        userInfo.setuId(uId);
        Map<String,Object> map = new HashMap<>();
        try {
            userService.updateOtherInfo(userInfo);
            map.put("msg","修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","修改失败！");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "userbase",method = RequestMethod.PUT)
    public Map<String,Object> modifyUserBase(@RequestBody UserBase userBase,
                                        HttpServletRequest request){
        Long uId = ServiceUtils.getUid(request);
        userBase.setuId(uId);
        Map<String,Object> map = new HashMap<>();
        try {
            userService.updateBaseInfo(userBase);
            map.put("msg","修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","修改失败！");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "modifypassword",method = RequestMethod.PUT)
    public Map<String,Object> modifyPassword(@RequestBody Map<String ,Object> body,
                                            HttpServletRequest request){
        Long uId = ServiceUtils.getUid(request);
        Map<String,Object> map = new HashMap<>();
        try {
            String password = (String) body.get("password");
            if(userService.authPassword(uId,password)){
                userService.updatePassword(uId, (String) body.get("newPassword"));
                map.put("msg","修改成功！");
            }else{
                map.put("err","原密码不正确！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","修改失败！");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "modifypaypass",method = RequestMethod.PUT)
    public Map<String,Object> modifyPayPass(@RequestBody Map<String ,Object> body,
                                             HttpServletRequest request){
        Long uId = ServiceUtils.getUid(request);
        Map<String,Object> map = new HashMap<>();
        try {
            String payPass= (String) body.get("payPass");
            if(userService.authPayPass(uId,payPass)){
                userService.updatePayPass(uId, (String) body.get("newPayPass"));
                map.put("msg","修改成功！");
            }else{
                map.put("err","原支付密码不正确！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","修改失败！");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "modifyBaseInfo",method = RequestMethod.PUT)
    public Map<String,Object> modifyBaseInfo(@RequestBody UserBase userBase,
                                            HttpServletRequest request){
        Long uId = ServiceUtils.getUid(request);
        userBase.setuId(uId);
        Map<String,Object> map = new HashMap<>();
        try {
            userService.updateBaseInfo(userBase);
            map.put("msg","修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","修改失败！");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "stuauth",method = RequestMethod.PUT)
    public Map<String,Object> modifyStuAuth(@RequestBody StuAuth stuAuth,
                                            HttpServletRequest request){
        Long uId = ServiceUtils.getUid(request);
        stuAuth.setuId(uId);
        Map<String,Object> map = new HashMap<>();
        try {
            stuAuthService.updateStuAuth(stuAuth);
            map.put("msg","修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","修改失败！");
        }
        return map;
    }
}
