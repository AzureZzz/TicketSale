package com.guet.service.impl;

import com.guet.dao.TrainBillMapper;
import com.guet.dao.UserBaseMapper;
import com.guet.entity.TrainBill;
import com.guet.service.ITrainBillService;
import com.guet.utils.ServiceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class TrainBillServiceImpl implements ITrainBillService {

    @Autowired
    private TrainBillMapper trainBillMapper;

    @Autowired
    private UserBaseMapper userBaseMapper;

    @Override
    public List<Integer> getWeekCount() throws Exception {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        int week = ServiceUtils.dayForWeek(df.format(new Date()));
        Date date = ServiceUtils.addAndSubtractDaysByCalendar(new Date(),1-week);
        List<Integer> result = new ArrayList<>();
        for(int i = 0;i<7;i++){
            result.add(trainBillMapper.selectTodayCount(df.format(date),df.format(ServiceUtils.addAndSubtractDaysByCalendar(date,1))));
            date = ServiceUtils.addAndSubtractDaysByCalendar(date,1);
        }
        return result;
    }

    @Override
    public List<TrainBill> getTodaySale(int page,int limit) throws Exception {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        System.out.println(df.format(date));
        return trainBillMapper.selectToday(df.format(date),ServiceUtils.getDayAddOne(df.format(date)), (page-1)*limit,limit);
    }

    @Override
    public int getTodayCount() throws Exception {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        return trainBillMapper.selectTodayCount(df.format(date),ServiceUtils.getDayAddOne(df.format(date)));
    }

    @Override
    public List<TrainBill> getUserTrainBill(int page, int limit, String username) throws Exception {
        Long uId = userBaseMapper.selectByUsername(username.trim()).getuId();
        return trainBillMapper.selectAllByUid((page-1)*limit,limit,uId);
    }

    @Override
    public int getUserTrainBillCount(String username) throws Exception {
        Long uId = userBaseMapper.selectByUsername(username.trim()).getuId();
        return trainBillMapper.selectCountByUid(uId);
    }
}
