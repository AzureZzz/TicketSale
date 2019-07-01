package com.guet.service.impl;

import com.guet.dao.PassengerMapper;
import com.guet.entity.Passenger;
import com.guet.service.IPassengerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PassengerServiceImpl implements IPassengerService {

    @Autowired
    private PassengerMapper passengerMapper;

    @Override
    public List<Passenger> getUserPassenger(Long uId) throws Exception {
        return passengerMapper.selectByUid(uId);
    }

    @Override
    public Long addPassenger(Passenger passenger) throws Exception {
        passenger.setCountry("中国/CHINA");
        passenger.setState(false);
        passengerMapper.insertSelective(passenger);
        return passenger.getpId();
    }

    @Override
    public void deletePassenger(Long pId) throws Exception {
        passengerMapper.deleteByPrimaryKey(pId);
    }

    @Override
    public void updatePassenger(Passenger passenger) throws Exception {
        passengerMapper.updateByPrimaryKeySelective(passenger);
    }

    @Override
    public Passenger getPassenger(Long pId) throws Exception {
        return passengerMapper.selectByPrimaryKey(pId);
    }
}
