package com.ob.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventAddCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String chk = request.getParameter("chk");
		String path = null;
		if (chk == null) {
			path = "event_add.jsp";
		} else {
			// 전달받은 값을 DB에 입력처리
			/*GuestbookVO vo = new GuestbookVO();
			vo.setName(request.getParameter("name"));
			vo.setSubject(request.getParameter("subject"));
			vo.setEmail(request.getParameter("email"));
			vo.setContent(request.getParameter("content"));
			vo.setPwd(request.getParameter("pwd"));
			DAO.insert(vo);*/
		/*	BoardVO vo = new BoardVO();
			vo.setId(id);
			vo.setUser_id(request.getParameter("user_id"));
			vo.setBoard_type(request.getParameter("board_type"));
			vo.setTitle(request.getParameter("title"));
			vo.setContent(request.getParameter("content"));
			vo.setWrite_date(write_date);
			vo.setRead_count(request.getParameter("read_count"));
//			id, user_id, type, title, content, write_date, read_count;
			path = "controller?type=list";*/
		}

		return path;
	}
}