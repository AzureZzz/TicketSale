package com.guet.dao;

import com.guet.entity.TrainTicket;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TrainTicketMapper extends ICommonMapper<TrainTicket,Long>{

    List<TrainTicket> selectAllRemain(@Param("start")int start, @Param("limit") int limit) throws Exception;


    List<TrainTicket> selectAllSale(@Param("start")int start, @Param("limit") int limit) throws Exception;

    List<TrainTicket> selectSale() throws Exception;

    TrainTicket selectByInfo(@Param("startStation")String startStation,@Param("desStation")String desStation,
                             @Param("trainNo")String trainNo,@Param("goOff")String goOff,
                             @Param("end")String end);
}