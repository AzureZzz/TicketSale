package com.guet.service;

import com.guet.entity.TrainSeat;
import com.guet.entity.TrainTicket;
import com.guet.entity.TrainTicketInfo;

import java.util.List;

public interface ITrainTicketService {

    int getAllCount()throws Exception;

    int getRemainCount()throws Exception;

    int getSaleCount()throws Exception;

    List<TrainTicketInfo> getRemainTrainTicket(int page, int limit)throws Exception;

    List<TrainTicketInfo> getSaleTrainTicket(int page, int limit)throws Exception;

    List<TrainTicketInfo> getSaleTrainTicket()throws Exception;

    void updateTrainTicket(TrainSeat trainSeat, TrainTicket trainTicket)throws Exception;

    void deleteTrainTicket(Long tsId)throws Exception;

    void addTrainTicket(TrainTicket trainTicket,TrainSeat trainSeat)throws Exception;

}
