package com.guet.service;

import com.guet.entity.Station;

import java.util.List;

public interface IStationService {

    /**
     * 查询指定城市的车站
     * @param city
     * @return
     * @throws Exception
     */
    List<Station> getStationByInfo(String city)throws Exception;

    /**
     * 查询指定名称车站
     * @param name
     * @return
     * @throws Exception
     */
    Station getStationByName(String name)throws Exception;
}
