package com.ob.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.BoardreplyVO;

public class queCommentsViewCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		
		BoardreplyVO vo = DAO.queCommentsSelOne(id);
		
		request.getSession().setAttribute("BPLYVO", vo);
		
		String path = "queView.jsp";
		
		return path;
	}

}
