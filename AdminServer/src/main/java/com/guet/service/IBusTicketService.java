package com.guet.service;


import com.guet.entity.BusTicketInfo;

import java.util.List;

public interface IBusTicketService {

    int getAllCount()throws Exception;

    int getRemainCount()throws Exception;

    int getSaleCount()throws Exception;

    List<BusTicketInfo> getReaminBusTicket(int page, int limit)throws Exception;

    List<BusTicketInfo> getSaleBusTicket(int page, int limit)throws Exception;

    List<BusTicketInfo> getSaleBusTicket()throws Exception;

    void updateBusTicket(Long bsId,String numNo,String seatNo)throws Exception;

    void deleteBusTicket(Long bsId)throws Exception;

    void addBusTickets(String numNo,int count)throws Exception;

}
