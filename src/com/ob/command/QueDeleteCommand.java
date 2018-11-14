package com.ob.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;

public class QueDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String chk = request.getParameter("delete_chk");
		String id = request.getParameter("delete_id");
		
		System.out.println("chk: " + chk + ", id: " + id);
		
		String path = null;
		
		if (chk == null) {
			path ="queView.jsp";
		} else {
			DAO.queDel(id);
			path = "controller?type=que&board_type=3";
		}
		return path;
	}

}
