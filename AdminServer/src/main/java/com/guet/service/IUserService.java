package com.guet.service;


import com.guet.entity.UserBase;

import java.util.List;

public interface IUserService {

    int getAllCount()throws Exception;

    List<UserBase> getUserBases(int page,int limit,String keyWord)throws  Exception;

    void updatePassword(Long uId, String newPassword) throws Exception;

    void deleteUser(Long uId)throws Exception;
    
}
