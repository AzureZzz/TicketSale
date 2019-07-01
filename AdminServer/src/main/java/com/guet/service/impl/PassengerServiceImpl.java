package com.guet.service.impl;

import com.guet.dao.BusBillMapper;
import com.guet.dao.TrainBillMapper;
import com.guet.entity.BusBill;
import com.guet.entity.Passenger;
import com.guet.service.IPassengerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PassengerServiceImpl implements IPassengerService {

    @Autowired
    private BusBillMapper busBillMapper;

    @Autowired
    private TrainBillMapper trainBillMapper;

    @Override
    public Passenger getPassengerByBsId(Long bsId) throws Exception {
        return busBillMapper.selectBybsId(bsId).getPassenger();
    }

    @Override
    public Passenger getPassengerByTsId(Long tsId) throws Exception {

        return trainBillMapper.selectByTsId(tsId).getPassenger();
    }

}
