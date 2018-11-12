package com.ob.vo;

public class RoomfileVO {
	String id,room_type_id,	filename;

	public RoomfileVO() {
		super();
	}

	public RoomfileVO(String id, String room_type_id, String filename) {
		super();
		this.id = id;
		this.room_type_id = room_type_id;
		this.filename = filename;
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
}
