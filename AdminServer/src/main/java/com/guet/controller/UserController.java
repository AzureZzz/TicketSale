package com.guet.controller;

import com.guet.annotation.AuthLogin;
import com.guet.entity.UserBase;
import com.guet.service.IUserService;
import com.guet.utils.LayUITableUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.awt.event.KeyEvent;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private LayUITableUtils<UserBase> layUIUserBase;

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "userbase/info",method = RequestMethod.GET)
    public Map<String,Object> queryUserBases(@RequestParam Integer page, @RequestParam Integer limit,
                                             @RequestParam String keyWord){
        Map<String,Object> map = null;
        try {
            map = layUIUserBase.getLayUIMap(userService.getUserBases(page,limit,keyWord),userService.getAllCount());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    @AuthLogin
    @ResponseBody
    @RequestMapping(value = "userbase/{uId}",method = RequestMethod.DELETE)
    public Map<String,Object> deleteUserBase(@PathVariable("uId")Long uId){
        Map<String,Object> map = new HashMap<>();
        try {
            userService.deleteUser(uId);
            map.put("msg","用户删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","用户删除失败！");
        }
        return map;
    }
}
