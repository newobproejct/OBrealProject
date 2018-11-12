package com.ob.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.BoardplusVO;

public class NoticeModiCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String chk = request.getParameter("update_chk");
		String id = request.getParameter("update_id");
		String uId = "1";
		String bType = request.getParameter("board_type");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String date = request.getParameter("write_date");
		String count = request.getParameter("read_count");
		
		System.out.println("id: " + id);
		
		String path = null;
		
		if (chk == null) {
			path = "noticeModi.jsp";
		} else {
			BoardplusVO vo = new BoardplusVO();
			
			vo.setId(id);
			vo.setUser_id(uId);
			vo.setBoard_type(bType);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setWrite_date(date);
			vo.setRead_count(count);
			
			DAO.noticeUp(vo);
			
			path = "controller?type=noticeView&board_type=1&id=" + id;
		}
		return path;
	}

}
