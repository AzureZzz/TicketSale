package com.guet.service.impl;

import com.guet.dao.AgencyMapper;
import com.guet.entity.Agency;
import com.guet.service.IAgencyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AgencyServiceImpl implements IAgencyService {

    @Autowired
    private AgencyMapper agencyMapper;

    @Override
    public List<Agency> getAgencyByInfo(String city) throws Exception {
        return agencyMapper.selectByCity(city);
    }

    @Override
    public Agency getAgencyByName(String name) throws Exception {
        return agencyMapper.selectByName(name);
    }
}
