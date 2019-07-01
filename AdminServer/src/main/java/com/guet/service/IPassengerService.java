package com.guet.service;

import com.guet.entity.Passenger;

public interface IPassengerService {

    Passenger getPassengerByBsId(Long bsId) throws Exception;

    Passenger getPassengerByTsId(Long tsId) throws Exception;

}
