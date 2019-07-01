package com.guet.service;

import com.guet.entity.TrainNum;

import java.util.List;

public interface ITrainNumService {

    List<TrainNum> getTrainNumByStation(int page,int limit, String station)throws Exception;

    int getTrainNumCountByStation(String station)throws Exception;

    void updateTrainNum(TrainNum trainNum) throws Exception;

    void deleteTrainNum(String trainNo) throws Exception;

    void addTrainNum(TrainNum trainNum)throws Exception;
}
