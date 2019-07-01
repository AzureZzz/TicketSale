package com.guet.service.impl;

import com.guet.dao.BusBillMapper;
import com.guet.dao.UserBaseMapper;
import com.guet.entity.BusBill;
import com.guet.service.IBusBillService;
import com.guet.utils.ServiceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class BusBillServiceImpl implements IBusBillService {

    @Autowired
    private BusBillMapper busBillMapper;

    @Autowired
    private UserBaseMapper userBaseMapper;

    @Override
    public List<Integer> getWeekCount() throws Exception {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        int week = ServiceUtils.dayForWeek(df.format(new Date()));
        Date date = ServiceUtils.addAndSubtractDaysByCalendar(new Date(),1-week);
        List<Integer> result = new ArrayList<>();
        for(int i = 0;i<7;i++){
            result.add(busBillMapper.selectTodayCount(df.format(date),df.format(ServiceUtils.addAndSubtractDaysByCalendar(date,1))));
            date = ServiceUtils.addAndSubtractDaysByCalendar(date,1);
        }
        return result;
    }

    @Override
    public List<BusBill> getTodaySale(int page, int limit) throws Exception {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        return busBillMapper.selectToday(df.format(date),ServiceUtils.getDayAddOne(df.format(date)), (page-1)*limit,limit);
    }

    @Override
    public int getTodayCount() throws Exception {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        return busBillMapper.selectTodayCount(df.format(date),ServiceUtils.getDayAddOne(df.format(date)));
    }

    @Override
    public List<BusBill> getUserBusBill(int page, int limit, String username) throws Exception {
        Long uId = userBaseMapper.selectByUsername(username.trim()).getuId();
        return busBillMapper.selectAllByUid((page-1)*limit,limit,uId);
    }

    @Override
    public int getUserBusBillCount(String username) throws Exception {
        Long uId = userBaseMapper.selectByUsername(username.trim()).getuId();
        return busBillMapper.selectCountByUid(uId);
    }
}
