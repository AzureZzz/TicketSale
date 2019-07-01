package com.guet.dao;

import com.guet.entity.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface AdminMapper extends ICommonMapper<Admin,Long>{

    Admin selectByUsernameAndPass(@Param("username")String username,@Param("password")String password)throws Exception;

}