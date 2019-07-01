package com.guet.service.impl;

import com.guet.dao.BusNumMapper;
import com.guet.entity.BusNum;
import com.guet.service.IBusNumService;
import com.guet.utils.ServiceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class BusNumServiceImpl implements IBusNumService {

    @Autowired
    private BusNumMapper busNumMapper;

    @Override
    public List<BusNum> getBusTicketsByInfo(String sCity, String dCity, String goTime) throws Exception {
        return busNumMapper.selectByInfo(sCity, dCity,goTime,ServiceUtils.getDayAddOne(goTime));
    }

    @Override
    public List<BusNum> getBusNumByInfo(String sCity, String dCity, String goTime) throws Exception {
        return busNumMapper.selectByInfo2(sCity,dCity,goTime,ServiceUtils.getDayAddOne(goTime));
    }

    @Override
    public BusNum getBusNumById(Long bId) throws Exception {
        return busNumMapper.selectByPrimaryKey(bId);
    }
}
