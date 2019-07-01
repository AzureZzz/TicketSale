package com.guet.service;

import com.guet.entity.Passenger;

import java.util.List;

public interface IPassengerService {

    List<Passenger> getUserPassenger(Long uId) throws Exception;

    Long addPassenger(Passenger passenger) throws Exception;

    void deletePassenger(Long pId)throws Exception;

    void updatePassenger(Passenger passenger)throws Exception;

    Passenger getPassenger(Long pId)throws Exception;

}
