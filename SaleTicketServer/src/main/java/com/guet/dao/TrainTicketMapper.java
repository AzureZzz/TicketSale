package com.guet.dao;

import com.guet.entity.TrainTicket;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface TrainTicketMapper extends ICommonMapper<TrainTicket,Long> {
}