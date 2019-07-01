package com.guet.entity;

import java.io.Serializable;
import java.util.Date;

public class Log implements Serializable {
    private Long lId;

    private String ip;

    private Date lastLogin;

    private String lastSite;

    private static final long serialVersionUID = 1L;

    public Long getlId() {
        return lId;
    }

    public void setlId(Long lId) {
        this.lId = lId;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public String getLastSite() {
        return lastSite;
    }

    public void setLastSite(String lastSite) {
        this.lastSite = lastSite == null ? null : lastSite.trim();
    }
}