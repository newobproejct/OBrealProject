package com.ob.vo;

public class AdminVO {
	String id, user_id, lv;

	public AdminVO() {
		super();
	}

	public AdminVO(String id, String user_id, String lv) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.lv = lv;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getLv() {
		return lv;
	}

	public void setLv(String lv) {
		this.lv = lv;
	}
	
}
