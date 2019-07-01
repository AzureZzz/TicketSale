package com.guet.entity;

import java.io.Serializable;
import java.util.Date;

public class StuAuth implements Serializable {
    private Long uId;

    private Long pId;

    private String province;

    private String school;

    private String department;

    private String stuClass;

    private String stuNo;

    private Short stuLen;

    private Date joinYear;

    private String disNum;

    private String disRanger;

    private static final long serialVersionUID = 1L;

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

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school == null ? null : school.trim();
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department == null ? null : department.trim();
    }

    public String getStuClass() {
        return stuClass;
    }

    public void setStuClass(String stuClass) {
        this.stuClass = stuClass == null ? null : stuClass.trim();
    }

    public String getStuNo() {
        return stuNo;
    }

    public void setStuNo(String stuNo) {
        this.stuNo = stuNo == null ? null : stuNo.trim();
    }

    public Short getStuLen() {
        return stuLen;
    }

    public void setStuLen(Short stuLen) {
        this.stuLen = stuLen;
    }

    public Date getJoinYear() {
        return joinYear;
    }

    public void setJoinYear(Date joinYear) {
        this.joinYear = joinYear;
    }

    public String getDisNum() {
        return disNum;
    }

    public void setDisNum(String disNum) {
        this.disNum = disNum == null ? null : disNum.trim();
    }

    public String getDisRanger() {
        return disRanger;
    }

    public void setDisRanger(String disRanger) {
        this.disRanger = disRanger == null ? null : disRanger.trim();
    }
}