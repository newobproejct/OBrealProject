package com.ob.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.BoardplusVO;

public class NoticeViewCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");

		BoardplusVO vo = DAO.noticeSelOne(id);
		
		request.getSession().setAttribute("BPVO", vo);
		
		String path = "noticeView.jsp";
	
		return path;
	}

}
