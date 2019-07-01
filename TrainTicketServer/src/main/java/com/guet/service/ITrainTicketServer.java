package com.guet.service;

import com.guet.entity.TrainTicket;

import java.util.List;

public interface ITrainTicketServer {

    /**
     * 火车票查询
     * @param startCity
     * @param desCity
     * @param goTime
     * @return
     */
    List<TrainTicket> getTrainTicketByInfo(String startCity,String desCity,String goTime) throws Exception;

    TrainTicket getTrainTicketById(Long ttId)throws Exception;
}
