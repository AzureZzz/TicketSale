package com.guet.dao;

import com.guet.entity.TrainBill;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TrainBillMapper extends ICommonMapper<TrainBill,Long> {
    void updateState(@Param("tbId") Long tbId,@Param("billState")boolean state)throws Exception;
}