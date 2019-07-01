package com.guet.service;

import com.guet.entity.BusNum;

import java.util.List;

public interface IBusNumService {

    List<BusNum> getBusNumByStation(int page,int limit,String station) throws Exception;

    int getBusNumCountBuStation(String station)throws Exception;

    void updateBusNum(BusNum busNum) throws Exception;

    void deleteBusNum(Long bId) throws Exception;

    void addBusNum(BusNum busNum)throws Exception;
}
