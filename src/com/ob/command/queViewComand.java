package com.ob.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.BoardplusVO;

public class queViewComand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		BoardplusVO vo = DAO.queSelOne(id);
		
		request.getSession().setAttribute("Bovo", vo);
		
		String path = "queView.jsp";
		
		return path;
	}

}
