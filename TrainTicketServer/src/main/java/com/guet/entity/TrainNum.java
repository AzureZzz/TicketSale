package com.guet.entity;

import java.io.Serializable;
import java.util.Date;

public class TrainNum implements Serializable {

    private String trainNo;

    private String startStation;

    private String desStation;

    private Date goOff;

    private Date arrive;

    private static final long serialVersionUID = 1L;

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

    public String getTrainNo() {
        return trainNo;
    }

    public void setTrainNo(String trainNo) {
        this.trainNo = trainNo == null ? null : trainNo.trim();
    }

    public Date getGoOff() {
        return goOff;
    }

    public void setGoOff(Date goOff) {
        this.goOff = goOff;
    }

    public Date getArrive() {
        return arrive;
    }

    public void setArrive(Date arrive) {
        this.arrive = arrive;
    }
}