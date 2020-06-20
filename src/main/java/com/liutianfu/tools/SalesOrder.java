package com.liutianfu.tools;

import com.liutianfu.tools.User;

import java.sql.Timestamp;
import java.util.List;

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

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
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

	public void save(){
		OrderMgr.getInstance().save(this);
	}

//	public List<SalesItem> getItems(){
//		return OrderMgr.getInstance().getSalesItems(this);
//	}
}
