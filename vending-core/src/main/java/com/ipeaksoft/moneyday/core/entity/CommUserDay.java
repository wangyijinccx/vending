package com.ipeaksoft.moneyday.core.entity;

import java.util.Date;

public class CommUserDay {
    private Integer id;

    private String userid;

    private Integer todayregisternum;

    private Integer todayrechargenum;

    private Double todaycommission;

    private Date time;

    private Integer todaywithdrawalscount;

    private Double todayrechargetotal;

    private Double todayrechargetd;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public Integer getTodayregisternum() {
        return todayregisternum;
    }

    public void setTodayregisternum(Integer todayregisternum) {
        this.todayregisternum = todayregisternum;
    }

    public Integer getTodayrechargenum() {
        return todayrechargenum;
    }

    public void setTodayrechargenum(Integer todayrechargenum) {
        this.todayrechargenum = todayrechargenum;
    }

    public Double getTodaycommission() {
        return todaycommission;
    }

    public void setTodaycommission(Double todaycommission) {
        this.todaycommission = todaycommission;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getTodaywithdrawalscount() {
        return todaywithdrawalscount;
    }

    public void setTodaywithdrawalscount(Integer todaywithdrawalscount) {
        this.todaywithdrawalscount = todaywithdrawalscount;
    }

    public Double getTodayrechargetotal() {
        return todayrechargetotal;
    }

    public void setTodayrechargetotal(Double todayrechargetotal) {
        this.todayrechargetotal = todayrechargetotal;
    }

    public Double getTodayrechargetd() {
        return todayrechargetd;
    }

    public void setTodayrechargetd(Double todayrechargetd) {
        this.todayrechargetd = todayrechargetd;
    }
}