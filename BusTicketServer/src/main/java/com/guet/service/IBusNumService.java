package com.guet.service;

import com.guet.entity.BusNum;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

public interface IBusNumService {
    /**
     * 汽车票查询
     * @param sCity 出发城市
     * @param dCity 到达城市
     * @param goTime 出发时间
     * @return 汽车票结果集
     * @throws Exception
     */
    List<BusNum> getBusTicketsByInfo(String sCity, String dCity, String goTime) throws Exception;

    /**
     * 汽车车次查询
     * @param sCity
     * @param dCity
     * @param goTime
     * @return
     * @throws Exception
     */
    List<BusNum> getBusNumByInfo(String sCity, String dCity, String goTime) throws Exception;

    BusNum getBusNumById(Long bId)throws Exception;
}
