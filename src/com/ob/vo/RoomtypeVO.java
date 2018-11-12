package com.ob.vo;

public class RoomtypeVO {
	String id, type, max_pax, cost;

	public RoomtypeVO() {
		super();
	}

	public RoomtypeVO(String id, String type, String max_pax, String cost) {
		super();
		this.id = id;
		this.type = type;
		this.max_pax = max_pax;
		this.cost = cost;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMax_pax() {
		return max_pax;
	}

	public void setMax_pax(String max_pax) {
		this.max_pax = max_pax;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}
}
