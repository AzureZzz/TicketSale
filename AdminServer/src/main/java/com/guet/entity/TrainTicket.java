package com.guet.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class TrainTicket implements Serializable {
    private Long ttId;

    private String startStation;

    private String desStation;

    private Long aId;

    private TrainNum trainNum;

    private Date goOff;

    private Date arriveTime;

    private String startPlace;

    private String desPlace;

    private List<TrainSeat> trainSeats;

    private static final long serialVersionUID = 1L;

    public Long getTtId() {
        return ttId;
    }

    public void setTtId(Long ttId) {
        this.ttId = ttId;
    }

    public String getStartStation() {
        return startStation;
    }

    public void setStartStation(String startStation) {
        this.startStation = startStation == null ? null : startStation.trim();
    }

    public String getDesStation() {
        return desStation;
    }

    public void setDesStation(String desStation) {
        this.desStation = desStation == null ? null : desStation.trim();
    }

    public Long getaId() {
        return aId;
    }

    public void setaId(Long aId) {
        this.aId = aId;
    }

    public TrainNum getTrainNum() {
        return trainNum;
    }

    public void setTrainNum(TrainNum trainNum) {
        this.trainNum = trainNum;
    }

    public Date getGoOff() {
        return goOff;
    }

    public void setGoOff(Date goOff) {
        this.goOff = goOff;
    }

    public Date getArriveTime() {
        return arriveTime;
    }

    public void setArriveTime(Date arriveTime) {
        this.arriveTime = arriveTime;
    }

    public String getStartPlace() {
        return startPlace;
    }

    public void setStartPlace(String startPlace) {
        this.startPlace = startPlace == null ? null : startPlace.trim();
    }

    public String getDesPlace() {
        return desPlace;
    }

    public void setDesPlace(String desPlace) {
        this.desPlace = desPlace == null ? null : desPlace.trim();
    }

    public List<TrainSeat> getTrainSeats() {
        return trainSeats;
    }

    public void setTrainSeats(List<TrainSeat> trainSeats) {
        this.trainSeats = trainSeats;
    }
}