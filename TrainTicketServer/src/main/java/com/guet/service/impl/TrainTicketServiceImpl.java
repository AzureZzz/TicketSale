package com.guet.service.impl;

import com.guet.dao.TrainTicketMapper;
import com.guet.entity.TrainTicket;
import com.guet.service.ITrainTicketServer;
import com.guet.utils.ServiceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TrainTicketServiceImpl implements ITrainTicketServer {

    @Autowired
    private TrainTicketMapper trainTicketMapper;

    @Override
    public List<TrainTicket> getTrainTicketByInfo(String startCity, String desCity, String goTime) throws Exception{
        return trainTicketMapper.selectByInfo(startCity,desCity,goTime,ServiceUtils.getDayAddOne(goTime));
    }

    @Override
    public TrainTicket getTrainTicketById(Long ttId) throws Exception {
        return trainTicketMapper.selectByPrimaryKey(ttId);
    }
}
