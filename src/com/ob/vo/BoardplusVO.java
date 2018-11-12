package com.ob.vo;

public class BoardplusVO {
	String id, user_id, board_type, title, content, write_date, read_count,
			board_id, filename, saved_filename,	filesize;
	String s_date, e_date, account, nickname;	//프리미엄 후기전용 변수
	
	public BoardplusVO() {
		super();
	}

	public BoardplusVO(String id, String user_id, String board_type, String title, String content, String write_date,
			String read_count, String board_id, String filename, String saved_filename, String filesize) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.board_type = board_type;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
		this.read_count = read_count;
		this.board_id = board_id;
		this.filename = filename;
		this.saved_filename = saved_filename;
		this.filesize = filesize;
	}

	public BoardplusVO(String id, String user_id, String board_type, String title, String content, String write_date,
			String read_count) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.board_type = board_type;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
		this.read_count = read_count;
	}

	public BoardplusVO(String id, String board_id, String filename, String saved_filename, String filesize) {
		super();
		this.id = id;
		this.board_id = board_id;
		this.filename = filename;
		this.saved_filename = saved_filename;
		this.filesize = filesize;
	}
	
	// 문의사항 게시판용
	public BoardplusVO(String id, String user_id, String board_type, String title, String content, String write_date,
			String read_count, String nickname) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.board_type = board_type;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
		this.read_count = read_count;
		this.nickname = nickname;
	}

	//프리미엄 후기용 생성자
	public BoardplusVO(String id, String user_id, String board_type, String title, String content, String write_date,
			String read_count, String board_id, String filename, String saved_filename, String filesize, String s_date,
			String e_date, String account, String nickname) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.board_type = board_type;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
		this.read_count = read_count;
		this.board_id = board_id;
		this.filename = filename;
		this.saved_filename = saved_filename;
		this.filesize = filesize;
		this.s_date = s_date;
		this.e_date = e_date;
		this.account = account;
		this.nickname = nickname;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
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

	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getRead_count() {
		return read_count;
	}

	public void setRead_count(String read_count) {
		this.read_count = read_count;
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getSaved_filename() {
		return saved_filename;
	}

	public void setSaved_filename(String saved_filename) {
		this.saved_filename = saved_filename;
	}

	public String getFilesize() {
		return filesize;
	}

	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}

	public String getS_date() {
		return s_date;
	}

	public void setS_date(String s_date) {
		this.s_date = s_date;
	}

	public String getE_date() {
		return e_date;
	}

	public void setE_date(String e_date) {
		this.e_date = e_date;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "BoardplusVO [id=" + id + ", user_id=" + user_id + ", board_type=" + board_type + ", title=" + title
				+ ", content=" + content + ", write_date=" + write_date + ", read_count=" + read_count + ", board_id="
				+ board_id + ", filename=" + filename + ", saved_filename=" + saved_filename + ", filesize=" + filesize
				+ "]";
	}
	
}
