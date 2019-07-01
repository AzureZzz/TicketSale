package com.guet.entity;

import java.io.Serializable;
import java.util.Date;

public class LateTrain implements Serializable {
    private Long ltId;

    private TrainTicket trainTicket;

    private Date newTime;

    private Boolean type;

    private static final long serialVersionUID = 1L;

    public Long getLtId() {
        return ltId;
    }

    public void setLtId(Long ltId) {
        this.ltId = ltId;
    }

    public TrainTicket getTrainTicket() {
        return trainTicket;
    }

    public void setTrainTicket(TrainTicket trainTicket) {
        this.trainTicket = trainTicket;
    }

    public Date getNewTime() {
        return newTime;
    }

    public void setNewTime(Date newTime) {
        this.newTime = newTime;
    }

    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }
}