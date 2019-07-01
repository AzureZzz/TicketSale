package com.guet.service.impl;

import com.guet.dao.PassengerMapper;
import com.guet.dao.StuAuthMapper;
import com.guet.entity.Passenger;
import com.guet.entity.StuAuth;
import com.guet.service.IStuAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class StuAuthServiceImpl implements IStuAuthService {

    @Autowired
    private StuAuthMapper stuAuthMapper;

    @Autowired
    private PassengerMapper passengerMapper;

    @Override
    public List<StuAuth> getAuths() throws Exception {
        return stuAuthMapper.selectAll();
    }

    @Override
    public List<StuAuth> getAuths(int page, int limit) throws Exception {
        return stuAuthMapper.selectAllPage((page-1)*limit,limit,null,null);
    }

    @Override
    public int getAllCount() throws Exception {
        return stuAuthMapper.selectAllCount();
    }

    @Override
    public void auth(Long pId, String disRange) throws Exception {
        StuAuth stuAuth = stuAuthMapper.selectByPid(pId);
        stuAuth.setDisRanger(disRange);
        stuAuth.setDisNum((new Date().getTime()+"").substring(0,9));
        Passenger passenger = new Passenger();
        passenger.setpId(pId);
        passenger.setState(true);
        passenger.setpType("学生");
        passengerMapper.updateByPrimaryKeySelective(passenger);
        stuAuthMapper.updateByPrimaryKeySelective(stuAuth);
    }

    @Override
    public void refuse(Long pId) throws Exception {
        Passenger passenger = new Passenger();
        passenger.setpId(pId);
        passenger.setState(false);
        passenger.setpType("成人");
        passengerMapper.updateByPrimaryKeySelective(passenger);
        stuAuthMapper.deleteByPid(pId);
    }

    @Override
    public StuAuth getPassengerStuAuth(Long pId) throws Exception {
        return stuAuthMapper.selectByPid(pId);
    }

}
