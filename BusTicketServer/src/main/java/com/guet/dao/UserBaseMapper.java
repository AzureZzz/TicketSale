package com.guet.dao;

import com.guet.entity.UserBase;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserBaseMapper extends ICommonMapper<UserBase,Long>{

    UserBase selectByUsernameAndPass(@Param("username") String username, @Param("password") String password) throws Exception;

    UserBase selectByUsername(@Param("username") String username) throws Exception;

    UserBase selectByIdCard(@Param("idCard") String idCard) throws Exception;

    UserBase selectByEmail(@Param("email") String email) throws Exception;

    UserBase selectByPhoneNumber(@Param("phoneNumber") String phoneNumber) throws Exception;

}