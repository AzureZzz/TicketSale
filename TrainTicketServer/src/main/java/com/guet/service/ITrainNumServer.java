package com.guet.service;

import com.guet.entity.TrainNum;

import java.util.List;

public interface ITrainNumServer {

    /**
     * 查询车站的车次
     * @param startStation
     * @param goTime
     * @return
     * @throws Exception
     */
    List<TrainNum> getTrainNumByInfo(String startStation,String goTime) throws Exception;

    /**
     * 按车次号查询指定车次
     * @param trainNo
     * @param goTime
     * @return
     * @throws Exception
     */
    TrainNum getTrainNumByNo(String trainNo,String goTime) throws Exception;

}
