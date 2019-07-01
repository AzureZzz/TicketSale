package com.guet.service.impl;

import com.guet.dao.ArticalMapper;
import com.guet.entity.Artical;
import com.guet.service.IArticalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticalServiceImpl implements IArticalService {

    @Autowired
    private ArticalMapper articalMapper;

    @Override
    public Artical getArtical(Long aId) throws Exception {
        return articalMapper.selectByPrimaryKey(aId);
    }

    @Override
    public List<Artical> getArticals() throws Exception {
        return articalMapper.selectAll();
    }
}
