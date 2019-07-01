package com.guet.service.impl;

import com.guet.dao.LateTrainMapper;
import com.guet.dao.TrainTicketMapper;
import com.guet.entity.LateTrain;
import com.guet.entity.TrainTicket;
import com.guet.service.ILateTrainService;
import com.guet.utils.ServiceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LateTrainServiceImpl implements ILateTrainService {

    @Autowired
    private LateTrainMapper lateTrainMapper;

    @Autowired
    private TrainTicketMapper trainTicketMapper;

    @Override
    public List<LateTrain> getAll() throws Exception {
        return lateTrainMapper.selectAll();
    }

    @Override
    public List<LateTrain> getAll(int page, int limit, String keyWord, String column) throws Exception {
        return lateTrainMapper.selectAllPage((page-1)*limit,limit,keyWord,column);
    }

    @Override
    public void deleteLateTrain(Long id) throws Exception {
        lateTrainMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Long addLateTrain(LateTrain lateTrain,String station,String desStation,String trainNo,String goOff) throws Exception {
        System.out.println(trainNo);
        TrainTicket trainTicket = trainTicketMapper.selectByInfo(station,desStation,trainNo,goOff,ServiceUtils.getDayAddOne(goOff));
        lateTrain.setTrainTicket(trainTicket);
        lateTrainMapper.insert(lateTrain);
        return lateTrain.getLtId();
    }

    @Override
    public void updateLateTrain(LateTrain lateTrain) throws Exception {
        lateTrainMapper.updateByPrimaryKeySelective(lateTrain);
    }

    @Override
    public int getAllCount() throws Exception {
        return lateTrainMapper.selectAllCount();
    }
}
