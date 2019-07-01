package com.guet.dao;

import com.guet.entity.BusNum;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface BusNumMapper extends ICommonMapper<BusNum,Long>{

    List<BusNum> selectAllRemain(@Param("start")int start, @Param("limit") int limit) throws Exception;

    List<BusNum> selectAllSale(@Param("start")int start, @Param("limit") int limit) throws Exception;

    List<BusNum> selectSale() throws Exception;

    List<BusNum> selectByStation(@Param("start")int start, @Param("limit") int limit,
                                 @Param("station") String station)throws Exception;

    Integer selectCountByStation(@Param("station") String station)throws Exception;

    BusNum selectByNumnNo(@Param("numNo")String numNo)throws Exception;
}