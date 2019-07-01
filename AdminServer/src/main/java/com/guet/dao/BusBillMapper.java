package com.guet.dao;

import com.guet.entity.BusBill;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface BusBillMapper extends ICommonMapper<BusBill,Long>{

    Integer selectTodayCount(@Param("dayStart")String dayStart,@Param("dayEnd") String dayEnd)throws Exception;

    List<BusBill> selectToday(@Param("dayStart")String dayStart,@Param("dayEnd") String dayEnd,
                              @Param("start")int start,@Param("limit") int limit)throws Exception;

    List<BusBill> selectAllByUid(@Param("start")int start,@Param("limit") int limit,@Param("uId")Long uId)throws Exception;

    Integer selectCountByUid(@Param("uId")Long uId)throws Exception;

    BusBill selectBybsId(@Param("bsId")Long bsId) throws Exception;
}