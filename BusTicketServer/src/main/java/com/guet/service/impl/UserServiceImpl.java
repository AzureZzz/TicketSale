package com.guet.service.impl;

import com.guet.dao.*;
import com.guet.entity.*;
import com.guet.service.IUserService;
import com.guet.utils.ServiceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.net.InetAddress;
import java.util.Date;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserBaseMapper userBaseMapper;

    @Autowired
    private LogMapper logMapper;

    @Autowired
    private UserInfoMapper userInfoMapper;

    @Autowired
    private StuAuthMapper stuAuthMapper;

    @Autowired
    private PassengerMapper passengerMapper;

    @Override
    public UserBase login(String username, String password) throws Exception {
        password = ServiceUtils.md5(password.trim());
        UserBase userBase = userBaseMapper.selectByUsernameAndPass(username.trim(),password);
        if(userBase != null){
            Log log = userBase.getLog();
            log.setLastLogin(new Date());
            log.setIp(String.valueOf(InetAddress.getLocalHost()));
            log.setLastSite("中国");
            logMapper.updateByPrimaryKeySelective(log);         //更新登陆日志
            userBase.setPassword("");               //密码置空
        }
        return userBase;
    }

    @Override
    public Long signup(UserBase userBase) throws Exception {
        Log log = new Log();                    //新建登陆日志
        log.setLastLogin(new Date());
        log.setIp(String.valueOf(InetAddress.getLocalHost()));
        log.setLastSite("中国");
        logMapper.insert(log);
        log.setlId(log.getlId());
        userBase.setLog(log);
        userBase.setPassword(ServiceUtils.md5(userBase.getPassword()));
        userBaseMapper.insert(userBase);
        UserInfo userInfo = new UserInfo();         //创建其他信息
        userInfo.setuId(userBase.getuId());
        userInfoMapper.insertSelective(userInfo);
        Passenger passenger = new Passenger();      //添加用户到乘客
        passenger.setuId(userBase.getuId());
        passenger.setCountry("中国/CHINA");
        passenger.setIdCard(userBase.getIdCard());
        passenger.setIdCardType(userBase.getIdCardType());
        passenger.setRealName(userBase.getRealName());
        passenger.setState(false);
        passenger.setpType(userBase.getUserType());
        passengerMapper.insert(passenger);
        logMapper.updateByPrimaryKeySelective(log);
        return userBase.getuId();
    }

    @Override
    public Long signupStu(UserBase userBase,StuAuth stuAuth) throws Exception {
        Log log = new Log();                    //新建登陆日志
        log.setLastLogin(new Date());
        log.setIp(String.valueOf(InetAddress.getLocalHost()));
        log.setLastSite("中国");
        logMapper.insert(log);
        log.setlId(log.getlId());
        userBase.setLog(log);
        userBase.setPassword(ServiceUtils.md5(userBase.getPassword()));
        userBaseMapper.insert(userBase);
        UserInfo userInfo = new UserInfo();
        userInfo.setuId(userBase.getuId());
        userInfoMapper.insertSelective(userInfo);
        Passenger passenger = new Passenger();      //添加用户到乘客
        passenger.setuId(userBase.getuId());
        passenger.setCountry("中国/CHINA");
        passenger.setIdCard(userBase.getIdCard());
        passenger.setIdCardType(userBase.getIdCardType());
        passenger.setRealName(userBase.getRealName());
        passenger.setState(false);
        passenger.setpType(userBase.getUserType());
        passengerMapper.insert(passenger);
        logMapper.updateByPrimaryKeySelective(log);
        stuAuth.setpId(passenger.getpId());
        stuAuth.setuId(userBase.getuId());
        stuAuthMapper.insert(stuAuth);
        return userBase.getuId();
    }

    @Override
    public UserBase getBaseInfo(Long uId) throws Exception {
        UserBase userBase = userBaseMapper.selectByPrimaryKey(uId);
        if(userBase!=null){
            userBase.setPassword("");
        }
        return userBase;
    }

    @Override
    public void updateBaseInfo(UserBase userBase) throws Exception {
        userBaseMapper.updateByPrimaryKeySelective(userBase);
    }

    @Override
    public UserInfo getOtherInfo(Long uId) throws Exception {
        return userInfoMapper.selectByPrimaryKey(uId);
    }

    @Override
    public void updateOtherInfo(UserInfo userInfo) throws Exception {
        userInfoMapper.updateByPrimaryKeySelective(userInfo);
    }

    @Override
    public StuAuth getStuInfo(Long uId) throws Exception {
        return stuAuthMapper.selectByPrimaryKey(uId);
    }


    @Override
    public void updatePassword(Long uId, String newPassword) throws Exception {
        UserBase userBase = new UserBase();
        userBase.setuId(uId);
        userBase.setPassword(ServiceUtils.md5(newPassword.trim()));
        userBaseMapper.updateByPrimaryKeySelective(userBase);
    }

    @Override
    public boolean authPayPass(Long uId, String payPass) throws Exception {
        UserBase userBase = userBaseMapper.selectByPrimaryKey(uId);
        if(ServiceUtils.md5(payPass.trim()).equals(userBase.getPayPass())){
            return true;
        }
        return false;
    }

    @Override
    public void updatePayPass(Long uId, String newPayPass) throws Exception {
        UserBase userBase = new UserBase();
        userBase.setuId(uId);
        userBase.setPayPass(ServiceUtils.md5(newPayPass.trim()));
        userBaseMapper.updateByPrimaryKeySelective(userBase);
    }

    @Override
    public UserBase getUserBaseByUsername(String username) throws Exception {
        return userBaseMapper.selectByUsername(username.trim());
    }

    @Override
    public UserBase getUserBaseByEmail(String email) throws Exception {
        return userBaseMapper.selectByEmail(email.trim());
    }

    @Override
    public UserBase getUserBaseByPhoneNumber(String phoneNumber) throws Exception {
        return userBaseMapper.selectByPhoneNumber(phoneNumber.trim());
    }

    @Override
    public UserBase getUserBaseByIdCard(String idCard) throws Exception {
        return userBaseMapper.selectByIdCard(idCard.trim());
    }

    @Override
    public boolean authPassword(Long uId, String password) throws Exception {
        UserBase userBase = userBaseMapper.selectByPrimaryKey(uId);
        if(ServiceUtils.md5(password.trim()).equals(userBase.getPassword())){
            return true;
        }
        return false;
    }

}
