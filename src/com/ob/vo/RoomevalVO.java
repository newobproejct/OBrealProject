package com.ob.vo;

public class RoomevalVO {
	String id, user_id, rate, content, write_date;

	public RoomevalVO() {
		super();
	}

	public RoomevalVO(String id, String user_id, String rate, String content, String write_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.rate = rate;
		this.content = content;
		this.write_date = write_date;
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

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	
}
