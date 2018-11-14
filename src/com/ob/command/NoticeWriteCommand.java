package com.ob.command;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import com.ob.command.Command;
import com.ob.dao.DAO;
import com.ob.vo.BoardplusVO;

public class NoticeWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String chk = request.getParameter("write_chk");
		String uId = "1";
		String bType = request.getParameter("board_type");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String date = request.getParameter("write_date");
		String count = request.getParameter("read_count");
		
		String path = null;
		
		if (chk == null) {
			path = "noticeWrite.jsp";
		} else {
			BoardplusVO vo = new BoardplusVO();
			
			vo.setUser_id(uId);
			vo.setBoard_type(bType);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setWrite_date(date);
			vo.setRead_count(count);
			
			DAO.noticeInsert(vo);
			
			path = "controller?type=notice&board_type=1";
		}
		return path;
	}

}
