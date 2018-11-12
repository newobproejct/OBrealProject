package com.ob.vo;

public class BoardreplyVO {
	String id, board_id, user_id, content, write_date;

	public BoardreplyVO() {
		super();
	}

	public BoardreplyVO(String id, String board_id, String user_id, String content, String write_date) {
		super();
		this.id = id;
		this.board_id = board_id;
		this.user_id = user_id;
		this.content = content;
		this.write_date = write_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
