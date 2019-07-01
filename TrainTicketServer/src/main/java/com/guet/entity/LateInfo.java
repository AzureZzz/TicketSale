package com.guet.entity;

import java.util.Date;

public class LateInfo {

    private String trainNo;

    private String startCity;

    private String desCity;

    private String startStation;

    private String desStation;

    private Date goOff;

    private Date arriveTime;

    private Date newGoOff;

    private Date newArriveTime;

    private Long lateTime;  //毫秒

    public String getTrainNo() {
        return trainNo;
    }

    public void setTrainNo(String trainNo) {
        this.trainNo = trainNo;
    }

    public String getStartCity() {
        return startCity;
    }

    public void setStartCity(String startCity) {
        this.startCity = startCity;
    }

    public String getDesCity() {
        return desCity;
    }

    public void setDesCity(String desCity) {
        this.desCity = desCity;
    }

    public String getStartStation() {
        return startStation;
    }

    public void setStartStation(String startStation) {
        this.startStation = startStation;
    }

    public String getDesStation() {
        return desStation;
    }

    public void setDesStation(String desStation) {
        this.desStation = desStation;
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

    public Date getNewGoOff() {
        return newGoOff;
    }

    public void setNewGoOff(Date newGoOff) {
        this.newGoOff = newGoOff;
    }

    public Date getNewArriveTime() {
        return newArriveTime;
    }

    public void setNewArriveTime(Date newArriveTime) {
        this.newArriveTime = newArriveTime;
    }

    public Long getLateTime() {
        return lateTime;
    }

    public void setLateTime(Long lateTime) {
        this.lateTime = lateTime;
    }
}
