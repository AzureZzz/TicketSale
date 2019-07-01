package com.guet.entity;

import java.io.Serializable;
import java.util.Date;

public class BusBill implements Serializable {

    private Long bbId;

    private Long uId;

    private Long pId;

    private Long bsId;

    private Float piece;

    private Boolean billState;

    private String billType;

    private String billNo;

    private Date buyTime;

    private static final long serialVersionUID = 1L;

    public Long getBbId() {
        return bbId;
    }

    public void setBbId(Long bbId) {
        this.bbId = bbId;
    }

    public Long getuId() {
        return uId;
    }

    public void setuId(Long uId) {
        this.uId = uId;
    }

    public Long getpId() {
        return pId;
    }

    public void setpId(Long pId) {
        this.pId = pId;
    }

    public Long getBsId() {
        return bsId;
    }

    public void setBsId(Long bsId) {
        this.bsId = bsId;
    }

    public Float getPiece() {
        return piece;
    }

    public void setPiece(Float piece) {
        this.piece = piece;
    }

    public Boolean getBillState() {
        return billState;
    }

    public void setBillState(Boolean billState) {
        this.billState = billState;
    }

    public String getBillType() {
        return billType;
    }

    public void setBillType(String billType) {
        this.billType = billType == null ? null : billType.trim();
    }

    public String getBillNo() {
        return billNo;
    }

    public void setBillNo(String billNo) {
        this.billNo = billNo == null ? null : billNo.trim();
    }

    public Date getBuyTime() {
        return buyTime;
    }

    public void setBuyTime(Date buyTime) {
        this.buyTime = buyTime;
    }

}