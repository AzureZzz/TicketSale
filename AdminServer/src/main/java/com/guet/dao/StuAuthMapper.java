package com.guet.dao;

import com.guet.entity.StuAuth;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface StuAuthMapper extends ICommonMapper<StuAuth,Long>{
    StuAuth selectByPid(@Param("pId") Long pId)throws Exception;
    void deleteByPid(@Param("pId") Long pId)throws Exception;
}