package com.guet.controller;

import com.guet.annotation.AuthLogin;
import com.guet.entity.Admin;
import com.guet.service.IAdminService;
import com.guet.utils.ServiceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

@Controller
public class AdminController {
    
    @Autowired
    private IAdminService adminService;

    @Autowired
    private RedisTemplate<String, Serializable> redis;


    @ResponseBody
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public Map<String,Object> login(@RequestBody Map<String,String> body,
                                    HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        String username = body.get("username").trim();
        String password = body.get("password").trim();
        if ("".equals(username) || "".equals(password)) {
            result.put("err", "用户名或密码不能为空");
            return result;
        }
        try {
            Admin admin = adminService.login(username, password);
            if (admin == null) {
                result.put("err", "用户名或密码错误!");
                return result;
            }
            request.getSession().setAttribute("aId",admin.getaId());
        } catch (Exception e) {
            e.printStackTrace();
            result.put("err", "登录失败!");
        }
        return result;
    }

    @AuthLogin
    @RequestMapping(value = "logout")
    public void logout(HttpServletRequest request,HttpServletResponse response) {
        request.getSession().removeAttribute("aId");
        try {
            response.sendRedirect("/login");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "modifypassword",method = RequestMethod.PUT)
    public Map<String,Object> modifyPassword(@RequestBody Map<String ,Object> body,
                                             HttpServletRequest request){
        Long aId = (Long) request.getSession().getAttribute("aId");
        Map<String,Object> map = new HashMap<>();
        try {
            String password = (String) body.get("password");
            if(adminService.authPassword(aId,password)){
                adminService.updatePassword(aId, (String) body.get("newPassword"));
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
}
