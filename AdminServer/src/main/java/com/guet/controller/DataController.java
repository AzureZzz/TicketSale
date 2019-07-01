package com.guet.controller;

import com.guet.dao.BusNumMapper;
import com.guet.dao.BusSeatMapper;
import com.guet.dao.TrainSeatMapper;
import com.guet.dao.TrainTicketMapper;
import com.guet.entity.BusNum;
import com.guet.entity.BusSeat;
import com.guet.entity.TrainSeat;
import com.guet.entity.TrainTicket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.security.krb5.internal.Ticket;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class DataController {

    @Autowired
    private BusNumMapper busNumMapper;

    @Autowired
    private BusSeatMapper busSeatMapper;

    @Autowired
    private TrainTicketMapper trainTicketMapper;

    @Autowired
    private TrainSeatMapper trainSeatMapper;

    @ResponseBody
    @RequestMapping(value = "addBusSeats",method = RequestMethod.GET)
    public Map<String,Object> addBusSeats(){
        Map<String,Object> map = new HashMap<>();
        try {
            List<BusNum> busNums = busNumMapper.selectAll();
            for (BusNum busNum : busNums) {
                for(int i =0;i<15;i++){
                    BusSeat busSeat = new BusSeat();
                    busSeat.setSeatNo((short) (i+1));
                    busSeat.setSeatState(false);
                    busSeat.setbId(busNum.getbId());
                    busSeatMapper.insert(busSeat);
                }
            }
            map.put("msg","添加成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","添加失败");
        }
        return map;
    }


    @ResponseBody
    @RequestMapping(value = "addTrainSeats",method = RequestMethod.GET)
    public Map<String,Object> addTrainSeats(){
        Map<String,Object> map = new HashMap<>();
        try {
            List<TrainTicket> trainTickets = trainTicketMapper.selectAll();
            for (TrainTicket trainTicket : trainTickets) {
                for(int i =0;i<8;i++){
                    TrainSeat trainSeat = new TrainSeat();
                    trainSeat.setTtId(trainTicket.getTtId());
                    trainSeat.setPiece((float) 256);
                    trainSeat.setSeatType("硬座");
                    trainSeat.setSeatState(false);
                    trainSeat.setSeatNo("17车"+(i+10)+"号");
                    trainSeatMapper.insert(trainSeat);
                }
                for(int i =0;i<8;i++){
                    TrainSeat trainSeat = new TrainSeat();
                    trainSeat.setTtId(trainTicket.getTtId());
                    trainSeat.setPiece((float) 256);
                    trainSeat.setSeatType("硬卧");
                    trainSeat.setSeatState(false);
                    trainSeat.setSeatNo("10车"+(i+10)+"车厢上铺");
                    trainSeatMapper.insert(trainSeat);
                }
                for(int i =0;i<8;i++){
                    TrainSeat trainSeat = new TrainSeat();
                    trainSeat.setTtId(trainTicket.getTtId());
                    trainSeat.setPiece((float) 256);
                    trainSeat.setSeatType("软座");
                    trainSeat.setSeatState(false);
                    trainSeat.setSeatNo("06车"+(i+10)+"号");
                    trainSeatMapper.insert(trainSeat);
                }
                for(int i =0;i<8;i++){
                    TrainSeat trainSeat = new TrainSeat();
                    trainSeat.setTtId(trainTicket.getTtId());
                    trainSeat.setPiece((float) 256);
                    trainSeat.setSeatType("软卧");
                    trainSeat.setSeatState(false);
                    trainSeat.setSeatNo("04车"+(i+10)+"车厢上铺");
                    trainSeatMapper.insert(trainSeat);
                }
            }
            map.put("msg","添加成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("err","添加失败");
        }
        return map;
    }
}
