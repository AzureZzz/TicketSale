package com.guet.service;

import com.guet.entity.Artical;

import java.util.List;

public interface IArticalService {

    Artical getArtical(Long aId)throws Exception;

    List<Artical> getArticals()throws Exception;
}
