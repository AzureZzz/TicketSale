package com.guet.service.impl;

import com.guet.dao.StuAuthMapper;
import com.guet.entity.StuAuth;
import com.guet.service.IStuAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StuAuthServiceImpl implements IStuAuthService {

    @Autowired
    private StuAuthMapper stuAuthMapper;

    @Override
    public Long addStuAuth(StuAuth stuAuth) throws Exception {
        return stuAuthMapper.insert(stuAuth);
    }

    @Override
    public void updateStuAuth(StuAuth stuAuth) throws Exception {
        stuAuthMapper.updateByPrimaryKeySelective(stuAuth);
    }
}
