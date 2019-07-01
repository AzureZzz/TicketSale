package com.guet.service.impl;

import com.guet.dao.LateTrainMapper;
import com.guet.dao.TrainTicketMapper;
import com.guet.entity.LateInfo;
import com.guet.entity.LateTrain;
import com.guet.entity.TrainTicket;
import com.guet.service.ILateTrainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LateTrainServiceImpl implements ILateTrainService {

    @Autowired
    private LateTrainMapper lateTrainMapper;

    @Autowired
    private TrainTicketMapper trainTicketMapper;


    @Override
    public LateInfo getLateTrainStart(String station, String trainNo, boolean tag) throws Exception {
        TrainTicket trainTicket = null;
        if(tag){
            trainTicket = trainTicketMapper.selectStart(station,trainNo);
        }else {
            trainTicket = trainTicketMapper.selectDes(station,trainNo);
        }
        if (trainTicket!=null){
            LateTrain lateTrain = lateTrainMapper.selectByttId(trainTicket.getTtId());
            if (lateTrain!=null){
                LateInfo lateInfo = new LateInfo();
                if(lateTrain.getType()){    //type为true表示出发站晚点
                    lateInfo.setNewGoOff(lateTrain.getNewTime());
                    lateInfo.setNewArriveTime(trainTicket.getArriveTime());
                    lateInfo.setLateTime(lateTrain.getNewTime().getTime()-trainTicket.getGoOff().getTime());
                }else{
                    lateInfo.setNewGoOff(trainTicket.getGoOff());
                    lateInfo.setNewArriveTime(lateTrain.getNewTime());
                    lateInfo.setLateTime(lateTrain.getNewTime().getTime()-trainTicket.getArriveTime().getTime());
                }
                lateInfo.setStartStation(trainTicket.getStartStation());
                lateInfo.setDesStation(trainTicket.getDesStation());
                lateInfo.setTrainNo(trainTicket.getTrainNum().getTrainNo());
                lateInfo.setGoOff(trainTicket.getGoOff());
                lateInfo.setArriveTime(trainTicket.getArriveTime());
                lateInfo.setStartCity(trainTicket.getStartPlace());
                lateInfo.setDesCity(trainTicket.getDesPlace());
                return lateInfo;
            }
        }
        return null;
    }
}
