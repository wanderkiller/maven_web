package com.liutianfu.tools;

import java.sql.Timestamp;

public class SalesOrder {
    private int id;
    private User user;
    private String addr;
    private Timestamp odate;
    private int status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getAddr() {
        return addr;
    }

    public Timestamp getOdate() {
        return odate;
    }

    public void setOdate(Timestamp odate) {
        this.odate = odate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void save() {
        OrderMgr.getInstance().save(this);
    }

}
