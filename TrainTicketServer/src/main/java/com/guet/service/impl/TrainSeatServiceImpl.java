package com.guet.service.impl;

import com.guet.dao.TrainSeatMapper;
import com.guet.entity.TrainSeat;
import com.guet.service.ITrainSeatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TrainSeatServiceImpl implements ITrainSeatService {

    @Autowired
    private TrainSeatMapper trainSeatMapper;
    @Override
    public List<TrainSeat> getTrainSeats(Long ttId, String seatType) throws Exception {
        return trainSeatMapper.selectByIdandType(ttId,seatType);
    }
}
