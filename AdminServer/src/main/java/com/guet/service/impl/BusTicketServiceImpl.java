package com.guet.service.impl;

import com.guet.dao.BusNumMapper;
import com.guet.dao.BusSeatMapper;
import com.guet.entity.BusNum;
import com.guet.entity.BusSeat;
import com.guet.entity.BusTicketInfo;
import com.guet.service.IBusTicketService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class BusTicketServiceImpl implements IBusTicketService {

    @Autowired
    private BusSeatMapper busSeatMapper;

    @Autowired
    private BusNumMapper busNumMapper;

    @Override
    public int getAllCount() throws Exception {
        return busSeatMapper.selectAllCount();
    }

    @Override
    public int getRemainCount() throws Exception {
        return busSeatMapper.selectRemainCount();
    }

    @Override
    public int getSaleCount() throws Exception {
        return busSeatMapper.selectSaleCount();
    }

    @Override
    public List<BusTicketInfo> getReaminBusTicket(int page, int limit) throws Exception {
        List<BusTicketInfo> infos = new ArrayList<>();
        List<BusNum> busNums = busNumMapper.selectAllRemain((page-1)*limit,limit);
        for (BusNum busNum:busNums) {
            List<BusSeat> seats = busNum.getBusSeats();
            for (BusSeat seat:seats) {
                BusTicketInfo busTicketInfo = new BusTicketInfo();
                busTicketInfo.setBusType(busNum.getBusType());
                busTicketInfo.setStartStation(busNum.getStartStation());
                busTicketInfo.setDesStation(busNum.getDesStation());
                busTicketInfo.setGoOff(busNum.getGoOff());
                busTicketInfo.setNumNo(busNum.getNumNo());
                busTicketInfo.setPiece(busNum.getPiece());
                busTicketInfo.setBsId(seat.getBsId());
                busTicketInfo.setSeatNo(seat.getSeatNo());
                infos.add(busTicketInfo);
            }
        }
        return infos;
    }

    @Override
    public List<BusTicketInfo> getSaleBusTicket(int page, int limit) throws Exception {
        List<BusTicketInfo> infos = new ArrayList<>();
        List<BusNum> busNums = busNumMapper.selectAllSale((page-1)*limit,limit);
        Iterator<BusNum> iterator = busNums.iterator();
        while (iterator.hasNext()){
            BusNum busNum = iterator.next();
            List<BusSeat> seats = busNum.getBusSeats();
            Iterator<BusSeat> it = seats.iterator();
            while (it.hasNext()){
                BusTicketInfo busTicketInfo = new BusTicketInfo();
                BusSeat seat = it.next();
                busTicketInfo.setBusType(busNum.getBusType());
                busTicketInfo.setStartStation(busNum.getStartStation());
                busTicketInfo.setDesStation(busNum.getDesStation());
                busTicketInfo.setGoOff(busNum.getGoOff());
                busTicketInfo.setNumNo(busNum.getNumNo());
                busTicketInfo.setPiece(busNum.getPiece());
                busTicketInfo.setBsId(seat.getBsId());
                busTicketInfo.setSeatNo(seat.getSeatNo());
                infos.add(busTicketInfo);
            }
        }
        return infos;
    }

    @Override
    public List<BusTicketInfo> getSaleBusTicket() throws Exception {
        List<BusTicketInfo> infos = new ArrayList<>();
        List<BusNum> busNums = busNumMapper.selectSale();
        Iterator<BusNum> iterator = busNums.iterator();
        while (iterator.hasNext()){
            BusNum busNum = iterator.next();
            List<BusSeat> seats = busNum.getBusSeats();
            Iterator<BusSeat> it = seats.iterator();
            while (it.hasNext()){
                BusTicketInfo busTicketInfo = new BusTicketInfo();
                BusSeat seat = it.next();
                busTicketInfo.setBusType(busNum.getBusType());
                busTicketInfo.setStartStation(busNum.getStartStation());
                busTicketInfo.setDesStation(busNum.getDesStation());
                busTicketInfo.setGoOff(busNum.getGoOff());
                busTicketInfo.setNumNo(busNum.getNumNo());
                busTicketInfo.setPiece(busNum.getPiece());
                busTicketInfo.setBsId(seat.getBsId());
                busTicketInfo.setSeatNo(seat.getSeatNo());
                infos.add(busTicketInfo);
            }
        }
        return infos;
    }

    @Override
    public void updateBusTicket(Long bsId, String numNo,String seatNo) throws Exception {
        BusSeat busSeat = new BusSeat();
        busSeat.setBsId(bsId);
        busSeat.setbId(busNumMapper.selectByNumnNo(numNo).getbId());
        busSeat.setSeatNo(Short.valueOf(seatNo));
        busSeatMapper.updateByPrimaryKeySelective(busSeat);
    }

    @Override
    public void deleteBusTicket(Long bsId) throws Exception {
        busSeatMapper.deleteByPrimaryKey(bsId);
    }

    @Override
    public void addBusTickets(String numNo, int count) throws Exception {
        BusNum busNum = busNumMapper.selectByNumnNo(numNo);
        for (int i=1;i<=count;i++){
            BusSeat busSeat = new BusSeat();
            busSeat.setbId(busNum.getbId());
            busSeat.setSeatNo((short) i);
            busSeat.setSeatState(false);
            busSeatMapper.insert(busSeat);
        }
    }

}
