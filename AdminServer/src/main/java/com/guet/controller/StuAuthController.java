package com.guet.controller;

import com.guet.annotation.AuthLogin;
import com.guet.entity.StuAuth;
import com.guet.service.IStuAuthService;
import com.guet.utils.LayUITableUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class StuAuthController {
    
    @Autowired
    private IStuAuthService stuAuthService;

    @Autowired
    private LayUITableUtils<StuAuth> layUIStuAuth;

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "stuauth",method = RequestMethod.GET)
    public Map<String,Object> getAuths(@RequestParam Integer page, @RequestParam Integer limit){
        Map<String ,Object> map = new HashMap<>();
        try {
            map = layUIStuAuth.getLayUIMap(stuAuthService.getAuths(page,limit),stuAuthService.getAllCount());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "stuauth/{id}",method = RequestMethod.DELETE)
    public Map<String,Object> refuseAuth(@PathVariable("id") Long pId){
        Map<String ,Object> map = new HashMap<>();
        try {
            stuAuthService.refuse(pId);
            map.put("msg","拒绝成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","拒绝失败！");
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "stuauth",method = RequestMethod.PUT)
    public Map<String,Object> auth(@RequestBody Map<String,Object> body){
        Map<String ,Object> map = new HashMap<>();
        String start = (String) body.get("startCity");
        String des = (String) body.get("desCity");
        Long pId = Long.valueOf((String) body.get("pId"));
        try {
            stuAuthService.auth(pId,start+"-"+des);
            map.put("msg","审核成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","审核失败！");
        }
        return map;
    }
}
