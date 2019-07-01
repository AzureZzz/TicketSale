package com.guet.service.impl;

import com.guet.dao.StationMapper;
import com.guet.entity.Station;
import com.guet.service.IStationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StationServiceImpl implements IStationService {

    @Autowired
    private StationMapper stationMapper;

    @Override
    public List<Station> getStationByInfo(String city) throws Exception {
        return stationMapper.selectByInfo(city);
    }

    @Override
    public Station getStationByName(String name) throws Exception {
        return stationMapper.selectByPrimaryKey(name);
    }
}
