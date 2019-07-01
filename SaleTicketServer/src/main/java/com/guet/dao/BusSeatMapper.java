package com.guet.dao;

import com.guet.entity.BusSeat;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface BusSeatMapper extends ICommonMapper<BusSeat,Long> {
    void updateState(@Param("bsId") Long bsId, @Param("seatState")Boolean state)throws Exception;
}