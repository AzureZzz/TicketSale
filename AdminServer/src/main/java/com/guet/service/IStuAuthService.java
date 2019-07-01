package com.guet.service;

import com.guet.entity.StuAuth;

import java.util.List;

public interface IStuAuthService {

    List<StuAuth> getAuths()throws Exception;

    List<StuAuth> getAuths(int page,int limit)throws Exception;

    int getAllCount()throws Exception;

    void auth(Long pId,String disRange) throws Exception;

    void refuse(Long pId)throws Exception;

    StuAuth getPassengerStuAuth(Long pId) throws Exception;
}
