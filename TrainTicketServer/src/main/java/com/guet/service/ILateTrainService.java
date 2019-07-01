package com.guet.service;

import com.guet.entity.LateInfo;

public interface ILateTrainService {


    LateInfo getLateTrainStart(String station, String trainNo,boolean tag)throws Exception;


}
