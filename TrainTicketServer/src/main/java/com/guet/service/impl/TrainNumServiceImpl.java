package com.guet.service.impl;

import com.guet.dao.TrainNumMapper;
import com.guet.entity.TrainNum;
import com.guet.service.ITrainNumServer;
import com.guet.utils.ServiceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TrainNumServiceImpl implements ITrainNumServer {

    @Autowired
    private TrainNumMapper trainNumMapper;

    @Override
    public List<TrainNum> getTrainNumByInfo(String startStation, String goTime) throws Exception {
        return trainNumMapper.selectByInfo(goTime,ServiceUtils.getDayAddOne(goTime),startStation);
    }

    @Override
    public TrainNum getTrainNumByNo(String trainNo,String goTime) throws Exception {
        return trainNumMapper.selectByNo(goTime,ServiceUtils.getDayAddOne(goTime),trainNo);
    }
}
