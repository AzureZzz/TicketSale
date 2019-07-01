package com.guet.dao;

import com.guet.entity.BusBill;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface BusBillMapper extends ICommonMapper<BusBill,Long>{

    void updateState(@Param("bbId") Long bbId,@Param("billState")boolean state)throws Exception;
}