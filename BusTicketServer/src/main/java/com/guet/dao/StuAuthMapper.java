package com.guet.dao;

import com.guet.entity.StuAuth;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface StuAuthMapper extends ICommonMapper<StuAuth,Long>{

}