package com.guet.service;

import com.guet.entity.TrainBill;
import com.guet.entity.TrainTicketInfo;

import java.util.List;

public interface ITrainBillService {

    List<Integer> getWeekCount() throws Exception;

    List<TrainBill> getTodaySale(int page,int limit)throws Exception;

    int getTodayCount()throws Exception;

    List<TrainBill> getUserTrainBill(int page, int limit, String username)throws Exception;

    int getUserTrainBillCount(String username)throws Exception;
}
