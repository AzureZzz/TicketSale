package com.guet.service;

import com.guet.entity.BusSeat;

public interface IBusTicketService {

    BusSeat getBusTicket(Long bsId)throws Exception;
}
