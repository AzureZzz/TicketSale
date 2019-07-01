package com.guet.service.impl;

import com.guet.dao.AdminMapper;
import com.guet.dao.LogMapper;
import com.guet.entity.Admin;
import com.guet.entity.Log;
import com.guet.service.IAdminService;
import com.guet.utils.ServiceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.net.InetAddress;
import java.util.Date;

@Service
public class AdminServiceImpl implements IAdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private LogMapper logMapper;

    @Override
    public Admin login(String username, String password) throws Exception {
        password = ServiceUtils.md5(password.trim());
        Admin admin = adminMapper.selectByUsernameAndPass(username.trim(),password);
        if(admin != null){
            Log log = admin.getLog();
            log.setLastLogin(new Date());
            log.setIp(String.valueOf(InetAddress.getLocalHost()));
            log.setLastSite("中国");
            logMapper.updateByPrimaryKeySelective(log);         //更新登陆日志
            admin.setPassword("");               //密码置空
        }
        return admin;
    }
    
    @Override
    public void updatePassword(Long aId, String newPassword) throws Exception {
        Admin admin = new Admin();
        admin.setaId(aId);
        admin.setPassword(ServiceUtils.md5(newPassword.trim()));
        adminMapper.updateByPrimaryKeySelective(admin);
    }

    @Override
    public boolean authPassword(Long Id, String password) throws Exception {
        System.out.println(Id);
        System.out.println(password);
        Admin admin = adminMapper.selectByPrimaryKey(Id);
        if(ServiceUtils.md5(password.trim()).equals(admin.getPassword())){
            return true;
        }
        return false;
    }

    @Override
    public Admin getAdminInfo(Long aId) throws Exception {
        return adminMapper.selectByPrimaryKey(aId);
    }
}
