package com.guet.service.impl;

import com.guet.dao.TrainNumMapper;
import com.guet.entity.TrainNum;
import com.guet.service.ITrainNumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TrainNumServiceImpl implements ITrainNumService {

    @Autowired
    private TrainNumMapper trainNumMapper;

    @Override
    public List<TrainNum> getTrainNumByStation(int page,int limit,String station) throws Exception {
        return trainNumMapper.selectByStation((page-1)*limit,limit,station);
    }

    @Override
    public int getTrainNumCountByStation(String station) throws Exception{
        return trainNumMapper.selectCountByStation(station);
    }

    @Override
    public void updateTrainNum(TrainNum trainNum) throws Exception {
        trainNumMapper.updateByPrimaryKeySelective(trainNum);
    }

    @Override
    public void deleteTrainNum(String trainNo) throws Exception {
        trainNumMapper.deleteByPrimaryKey(trainNo);
    }

    @Override
    public void addTrainNum(TrainNum trainNum) throws Exception {
        trainNumMapper.insert(trainNum);
    }


}
