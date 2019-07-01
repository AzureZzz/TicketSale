package com.guet.service.impl;

import com.guet.dao.StationMapper;
import com.guet.dao.TrainSeatMapper;
import com.guet.dao.TrainTicketMapper;
import com.guet.entity.*;
import com.guet.service.ITrainTicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class TrainTicketServiceImpl implements ITrainTicketService {

    @Autowired
    private TrainTicketMapper trainTicketMapper;
    
    @Autowired
    private TrainSeatMapper trainSeatMapper;

    @Autowired
    private StationMapper stationMapper;
    
    @Override
    public int getAllCount() throws Exception {
        return trainSeatMapper.selectAllCount();
    }

    @Override
    public int getRemainCount() throws Exception {
        return trainSeatMapper.selectRemainCount();
    }

    @Override
    public int getSaleCount() throws Exception {
        return trainSeatMapper.selectSaleCount();
    }

    @Override
    public List<TrainTicketInfo> getRemainTrainTicket(int page, int limit) throws Exception {
        List<TrainTicketInfo> ticketInfos = new ArrayList<>();
        List<TrainTicket> trainTickets = trainTicketMapper.selectAllRemain((page-1)*limit,limit);
        Iterator<TrainTicket> iterator = trainTickets.iterator();
        while (iterator.hasNext()){
            TrainTicket trainTicket = iterator.next();
            List<TrainSeat> seats = trainTicket.getTrainSeats();
            Iterator<TrainSeat> it = seats.iterator();
            while (it.hasNext()){
                TrainSeat seat = it.next();
                TrainTicketInfo trainTicketInfo = new TrainTicketInfo();
                trainTicketInfo.setGoOff(trainTicket.getGoOff());
                trainTicketInfo.setArriveTime(trainTicket.getArriveTime());
                trainTicketInfo.setStartStation(trainTicket.getStartStation());
                trainTicketInfo.setDesStation(trainTicket.getDesStation());
                trainTicketInfo.setTrainNo(trainTicket.getTrainNum().getTrainNo());
                trainTicketInfo.setPiece(seat.getPiece());
                trainTicketInfo.setTsId(seat.getTsId());
                trainTicketInfo.setSeatType(seat.getSeatType());
                trainTicketInfo.setSeatNo(seat.getSeatNo());
                ticketInfos.add(trainTicketInfo);
            }
        }
        return ticketInfos;
    }

    @Override
    public List<TrainTicketInfo> getSaleTrainTicket(int page, int limit) throws Exception {
        List<TrainTicketInfo> ticketInfos = new ArrayList<>();
        List<TrainTicket> trainTickets = trainTicketMapper.selectAllSale((page-1)*limit,limit);
        Iterator<TrainTicket> iterator = trainTickets.iterator();
        while (iterator.hasNext()){
            TrainTicket trainTicket = iterator.next();
            List<TrainSeat> seats = trainTicket.getTrainSeats();
            Iterator<TrainSeat> it = seats.iterator();
            while (it.hasNext()){
                TrainTicketInfo trainTicketInfo = new TrainTicketInfo();
                TrainSeat seat = it.next();
                trainTicketInfo.setGoOff(trainTicket.getGoOff());
                trainTicketInfo.setArriveTime(trainTicket.getArriveTime());
                trainTicketInfo.setStartStation(trainTicket.getStartStation());
                trainTicketInfo.setDesStation(trainTicket.getDesStation());
                trainTicketInfo.setTrainNo(trainTicket.getTrainNum().getTrainNo());
                trainTicketInfo.setPiece(seat.getPiece());
                trainTicketInfo.setTsId(seat.getTsId());
                trainTicketInfo.setSeatType(seat.getSeatType());
                trainTicketInfo.setSeatNo(seat.getSeatNo());
                ticketInfos.add(trainTicketInfo);
            }
        }
        return ticketInfos;
    }

    @Override
    public List<TrainTicketInfo> getSaleTrainTicket() throws Exception {
        List<TrainTicketInfo> ticketInfos = new ArrayList<>();
        List<TrainTicket> trainTickets = trainTicketMapper.selectSale();
        Iterator<TrainTicket> iterator = trainTickets.iterator();
        while (iterator.hasNext()){
            TrainTicket trainTicket = iterator.next();
            List<TrainSeat> seats = trainTicket.getTrainSeats();
            Iterator<TrainSeat> it = seats.iterator();
            while (it.hasNext()){
                TrainTicketInfo trainTicketInfo = new TrainTicketInfo();
                TrainSeat seat = it.next();
                trainTicketInfo.setGoOff(trainTicket.getGoOff());
                trainTicketInfo.setArriveTime(trainTicket.getArriveTime());
                trainTicketInfo.setStartStation(trainTicket.getStartStation());
                trainTicketInfo.setDesStation(trainTicket.getDesStation());
                trainTicketInfo.setTrainNo(trainTicket.getTrainNum().getTrainNo());
                trainTicketInfo.setPiece(seat.getPiece());
                trainTicketInfo.setTsId(seat.getTsId());
                trainTicketInfo.setSeatType(seat.getSeatType());
                trainTicketInfo.setSeatNo(seat.getSeatNo());
                ticketInfos.add(trainTicketInfo);
            }
        }
        return ticketInfos;
    }

    @Override
    public void updateTrainTicket(TrainSeat trainSeat, TrainTicket trainTicket) throws Exception {
        trainTicket.setTtId(trainSeatMapper.selectByPrimaryKey(trainSeat.getTsId()).getTtId());
        trainTicketMapper.updateByPrimaryKeySelective(trainTicket);
        trainSeatMapper.updateByPrimaryKeySelective(trainSeat);
    }

    @Override
    public void deleteTrainTicket(Long tsId) throws Exception {
        trainSeatMapper.deleteByPrimaryKey(tsId);
    }

    @Override
    public void addTrainTicket(TrainTicket trainTicket, TrainSeat trainSeat) throws Exception {
        trainTicket.setStartPlace(stationMapper.selectByPrimaryKey(trainTicket.getStartStation()).getCity());
        trainTicket.setDesPlace(stationMapper.selectByPrimaryKey(trainTicket.getDesStation()).getCity());
        trainTicketMapper.insertSelective(trainTicket);
        trainSeat.setTtId(trainTicket.getTtId());
        trainSeat.setSeatState(false);
        trainSeatMapper.insertSelective(trainSeat);
    }

}
