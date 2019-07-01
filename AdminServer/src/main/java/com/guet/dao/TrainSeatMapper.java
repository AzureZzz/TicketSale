package com.guet.dao;

import com.guet.entity.TrainSeat;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TrainSeatMapper extends ICommonMapper<TrainSeat,Long>{

    int selectRemainCount()throws Exception;

    int selectSaleCount()throws Exception;

    List<TrainSeat> selectByTtidRemain(@Param("ttId") Long ttId)throws Exception;

    List<TrainSeat> selectByTtidSale(@Param("ttId") Long ttId)throws Exception;
}