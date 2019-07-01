package com.guet.service.impl;

import com.guet.dao.PassengerMapper;
import com.guet.dao.StuAuthMapper;
import com.guet.dao.UserBaseMapper;
import com.guet.entity.Log;
import com.guet.entity.Passenger;
import com.guet.entity.StuAuth;
import com.guet.entity.UserBase;
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
    private StuAuthMapper stuAuthMapper;

    @Autowired
    private PassengerMapper passengerMapper;

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


}
