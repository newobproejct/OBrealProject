package com.ob.vo;

public class Si_GuVO {
	private String room_address1, room_address2;

	public String getRoom_address1() {
		return room_address1;
	}

	public void setRoom_address1(String room_address1) {
		this.room_address1 = room_address1;
	}

	@Override
	public String toString() {
		return "Si_GuVO [room_address1=" + room_address1 + ", room_address2=" + room_address2 + "]";
	}

	public String getRoom_address2() {
		return room_address2;
	}

	public void setRoom_address2(String room_address2) {
		this.room_address2 = room_address2;
	}
}
