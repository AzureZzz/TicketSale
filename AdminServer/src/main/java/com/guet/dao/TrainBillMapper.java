package com.guet.dao;

import com.guet.entity.TrainBill;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TrainBillMapper extends ICommonMapper<TrainBill,Long>{
    Integer selectTodayCount(@Param("dayStart")String dayStart, @Param("dayEnd") String dayEnd)throws Exception;

    List<TrainBill> selectToday(@Param("dayStart")String dayStart, @Param("dayEnd") String dayEnd,
                                @Param("start")int start,@Param("limit") int limit)throws Exception;

    List<TrainBill> selectAllByUid(@Param("start")int start,@Param("limit") int limit,@Param("uId")Long uId)throws Exception;

    Integer selectCountByUid(@Param("uId")Long uId)throws Exception;

    TrainBill selectByTsId(@Param("tsId")Long tsId) throws Exception;
}