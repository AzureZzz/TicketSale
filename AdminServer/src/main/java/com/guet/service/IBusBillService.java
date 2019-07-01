package com.guet.service;

import com.guet.entity.BusBill;

import java.util.List;

public interface IBusBillService {

    List<Integer> getWeekCount() throws Exception;

    List<BusBill> getTodaySale(int page,int limit)throws Exception;

    int getTodayCount()throws Exception;

    List<BusBill> getUserBusBill(int page, int limit,String username)throws Exception;

    int getUserBusBillCount(String username)throws Exception;
}
