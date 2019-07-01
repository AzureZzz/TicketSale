package com.guet.service.impl;

import com.guet.dao.BusBillMapper;
import com.guet.entity.BusBill;
import com.guet.entity.BusNum;
import com.guet.service.IBusBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BusBillServiceImpl implements IBusBillService {

    @Autowired
    private BusBillMapper busBillMapper;

    @Override
    public BusBill getBusBill(Long bbId) throws Exception {
        return busBillMapper.selectByPrimaryKey(bbId);
    }

    @Override
    public List<BusBill> getUserBusBillsPay(Long uId) throws Exception{
        return busBillMapper.selectByUidPay(uId);
    }

    @Override
    public List<BusBill> getUserBusBillsUnPay(Long uId) throws Exception {
        return busBillMapper.selectByUidUnPay(uId);
    }

}
