package com.guet.service.impl;

import com.guet.dao.BusSeatMapper;
import com.guet.entity.BusSeat;
import com.guet.service.IBusTicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BusTicketServiceImpl implements IBusTicketService {

    @Autowired
    private BusSeatMapper busSeatMapper;

    @Override
    public BusSeat getBusTicket(Long bsId) throws Exception {
        return busSeatMapper.selectByPrimaryKey(bsId);
    }
}
