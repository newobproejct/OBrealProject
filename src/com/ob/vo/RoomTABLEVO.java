package com.ob.vo;

public class RoomTABLEVO {
	String r_num, room_id, room_name, room_num, room_content, room_address1, room_address2, room_theme, file_id, filename, type_id,
			room_type, max_pax, cost;
	
	

	public RoomTABLEVO() {
		super();
	}



	public RoomTABLEVO(String r_num, String room_id, String room_name, String room_num, String room_content,
			String room_address1, String room_address2, String room_theme, String file_id, String filename,
			String type_id, String room_type, String max_pax, String cost) {
		super();
		this.r_num = r_num;
		this.room_id = room_id;
		this.room_name = room_name;
		this.room_num = room_num;
		this.room_content = room_content;
		this.room_address1 = room_address1;
		this.room_address2 = room_address2;
		this.room_theme = room_theme;
		this.file_id = file_id;
		this.filename = filename;
		this.type_id = type_id;
		this.room_type = room_type;
		this.max_pax = max_pax;
		this.cost = cost;
	}



	public String getR_num() {
		return r_num;
	}



	public void setR_num(String r_num) {
		this.r_num = r_num;
	}



	public String getRoom_id() {
		return room_id;
	}



	public void setRoom_id(String room_id) {
		this.room_id = room_id;
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



	public String getFile_id() {
		return file_id;
	}



	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}



	public String getFilename() {
		return filename;
	}



	public void setFilename(String filename) {
		this.filename = filename;
	}



	public String getType_id() {
		return type_id;
	}



	public void setType_id(String type_id) {
		this.type_id = type_id;
	}



	public String getRoom_type() {
		return room_type;
	}



	public void setRoom_type(String room_type) {
		this.room_type = room_type;
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



	@Override
	public String toString() {
		return "RoomTABLEVO [r_num=" + r_num + ", room_id=" + room_id + ", room_name=" + room_name + ", room_num="
				+ room_num + ", room_content=" + room_content + ", room_address1=" + room_address1 + ", room_address2="
				+ room_address2 + ", room_theme=" + room_theme + ", file_id=" + file_id + ", filename=" + filename
				+ ", type_id=" + type_id + ", room_type=" + room_type + ", max_pax=" + max_pax + ", cost=" + cost + "]";
	}
	

}