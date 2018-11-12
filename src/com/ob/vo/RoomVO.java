package com.ob.vo;

public class RoomVO {
	String id, room_type_id, room_name, room_num, room_content, room_address1, room_address2 ,room_theme;

	public RoomVO() {
		super();
	}

	public RoomVO(String id, String room_type_id, String room_name, String room_num, String room_content,
			String room_address1, String room_address2, String room_theme) {
		super();
		this.id = id;
		this.room_type_id = room_type_id;
		this.room_name = room_name;
		this.room_num = room_num;
		this.room_content = room_content;
		this.room_address1 = room_address1;
		this.room_address2 = room_address2;
		this.room_theme = room_theme;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoom_type_id() {
		return room_type_id;
	}

	public void setRoom_type_id(String room_type_id) {
		this.room_type_id = room_type_id;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public String getRoom_num() {
		return room_num;
	}

	public void setRoom_num(String room_num) {
		this.room_num = room_num;
	}

	public String getRoom_content() {
		return room_content;
	}

	public void setRoom_content(String room_content) {
		this.room_content = room_content;
	}

	public String getRoom_address1() {
		return room_address1;
	}

	public void setRoom_address1(String room_address1) {
		this.room_address1 = room_address1;
	}

	public String getRoom_address2() {
		return room_address2;
	}

	public void setRoom_address2(String room_address2) {
		this.room_address2 = room_address2;
	}

	public String getRoom_theme() {
		return room_theme;
	}

	public void setRoom_theme(String room_theme) {
		this.room_theme = room_theme;
	}

	@Override
	public String toString() {
		return "RoomVO [id=" + id + ", room_type_id=" + room_type_id + ", room_name=" + room_name + ", room_num="
				+ room_num + ", room_content=" + room_content + ", room_address1=" + room_address1 + ", room_address2="
				+ room_address2 + ", room_theme=" + room_theme + "]";
	}
	

}