package com.guet.service;

import com.guet.entity.TrainSeat;

import java.util.List;

public interface ITrainSeatService {

    List<TrainSeat> getTrainSeats(Long ttId,String seatType)throws Exception;

}
