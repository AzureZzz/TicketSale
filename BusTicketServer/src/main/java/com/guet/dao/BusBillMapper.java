package com.guet.dao;

import com.guet.entity.BusBill;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface BusBillMapper extends ICommonMapper<BusBill,Long>{

    List<BusBill> selectByUidPay(@Param("uId") Long uId) throws Exception;

    List<BusBill> selectByUidUnPay(@Param("uId") Long uId) throws Exception;

}