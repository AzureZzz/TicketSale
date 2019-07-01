package com.guet.service;

import com.guet.entity.Station;

import java.util.List;

public interface IStationService {

    /**
     * 车站查询（名称）
     * @param stationName 车站名
     * @return  车站信息
     * @throws Exception
     */
    Station getStationByName(String stationName)throws Exception;

    /**
     * 车站查询（省市县）
     * @param city 所在城市
     * @return 车站结果集
     * @throws Exception
     */
    List<Station> getStationsByInfo(String city)throws Exception;

}
