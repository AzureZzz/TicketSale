package com.guet.service.impl;

import com.guet.annotation.AuthLogin;
import com.guet.dao.BusNumMapper;
import com.guet.dao.StationMapper;
import com.guet.entity.BusNum;
import com.guet.service.IBusNumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BusNumServiceImpl implements IBusNumService {

    @Autowired
    private BusNumMapper busNumMapper;

    @Autowired
    private StationMapper stationMapper;

    @Override
    public List<BusNum> getBusNumByStation(int page,int limit,String station) throws Exception {
        return busNumMapper.selectByStation((page-1)*limit,limit,station);
    }

    @Override
    public int getBusNumCountBuStation(String station) throws Exception {
        return busNumMapper.selectCountByStation(station);
    }

    @Override
    public void updateBusNum(BusNum busNum) throws Exception {
        busNumMapper.updateByPrimaryKeySelective(busNum);
    }

    @Override
    public void deleteBusNum(Long bId) throws Exception {
        busNumMapper.deleteByPrimaryKey(bId);
    }

    @Override
    public void addBusNum(BusNum busNum) throws Exception {
        busNum.setStartCity(stationMapper.selectByPrimaryKey(busNum.getStartStation()).getCity());
        busNum.setArriveCity(stationMapper.selectByPrimaryKey(busNum.getDesStation()).getCity());
        busNumMapper.insertSelective(busNum);
    }
}
