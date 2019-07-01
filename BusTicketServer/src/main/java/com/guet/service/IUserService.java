package com.guet.service;

import com.guet.entity.StuAuth;
import com.guet.entity.UserBase;
import com.guet.entity.UserInfo;

public interface IUserService {

    UserBase login(String username, String password) throws Exception;

    Long signup(UserBase userBase) throws Exception;

    Long signupStu(UserBase userBase,StuAuth stuAuth) throws Exception;

    UserBase getBaseInfo(Long uId) throws Exception;

    void updateBaseInfo(UserBase userBase) throws Exception;

    UserInfo getOtherInfo(Long uId) throws Exception;

    void updateOtherInfo(UserInfo userInfo) throws Exception;

    StuAuth getStuInfo(Long uId) throws Exception;



    UserBase getUserBaseByUsername(String username)throws Exception;

    UserBase getUserBaseByEmail(String email)throws Exception;

    UserBase getUserBaseByPhoneNumber(String phoneNumber)throws Exception;

    UserBase getUserBaseByIdCard(String idCard)throws Exception;

    boolean authPassword(Long uId,String password) throws Exception;

    void updatePassword(Long uId,String newPassword) throws Exception;

    boolean authPayPass(Long uId,String payPass) throws Exception;

    void updatePayPass(Long uId,String newPayPass) throws Exception;
}
