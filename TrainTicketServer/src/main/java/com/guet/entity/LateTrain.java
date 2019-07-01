package com.guet.entity;

import java.io.Serializable;
import java.util.Date;

public class LateTrain implements Serializable {
    private Long ltId;

    private Long ttId;

    private Date newTime;

    private Boolean type;

    private static final long serialVersionUID = 1L;

    public Long getLtId() {
        return ltId;
    }

    public void setLtId(Long ltId) {
        this.ltId = ltId;
    }

    public Long getTtId() {
        return ttId;
    }

    public void setTtId(Long ttId) {
        this.ttId = ttId;
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