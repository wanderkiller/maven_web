package com.liutianfu.tools;

import java.sql.Timestamp;

public class Product {
    private int id;
    private String name;
    private String descr;
    private double normalprice;
    private double memberprice;
    private Timestamp pdate;
    private int categoryid;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public double getNormalprice() {
        return normalprice;
    }

    public void setNormalprice(double normalprice) {
        this.normalprice = normalprice;
    }

    public void setMemberprice(double memberprice) {
        this.memberprice = memberprice;
    }

    public void setPdate(Timestamp pdate) {
        this.pdate = pdate;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

}
