package com.guet.service;

public interface IUserService {

    boolean authPayPass(Long uId, String payPass) throws Exception;

    void updatePayPass(Long uId, String newPayPass) throws Exception;

}
