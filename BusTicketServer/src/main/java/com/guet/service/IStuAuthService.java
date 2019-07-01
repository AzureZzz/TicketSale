package com.guet.service;

import com.guet.entity.StuAuth;

public interface IStuAuthService {

    Long addStuAuth(StuAuth stuAuth)throws Exception;

    void updateStuAuth(StuAuth stuAuth)throws Exception;
}
