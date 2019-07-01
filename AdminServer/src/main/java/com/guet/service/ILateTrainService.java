package com.guet.service;

import com.guet.entity.LateTrain;

import java.util.List;

public interface ILateTrainService {

    List<LateTrain> getAll()throws Exception;

    List<LateTrain> getAll(int page,int limit,String keyWord,String column)throws Exception;

    void deleteLateTrain(Long id)throws Exception;

    Long addLateTrain(LateTrain lateTrain,String station,String desStation,String trainNo,String goOff) throws Exception;

    void updateLateTrain(LateTrain lateTrain) throws Exception;

    int getAllCount()throws Exception;
}
