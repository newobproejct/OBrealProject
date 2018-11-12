package com.ob.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.command.Command;
import com.ob.dao.DAO;
import com.ob.vo.BoardplusVO;

public class Event_DetailCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String b_id = request.getParameter("b_id");
		System.out.println(b_id);
		
		BoardplusVO vo = DAO.getDeatil(b_id);
		
		request.getSession().setAttribute("event_detail", vo);
		
		
		return "event_detail.jsp";
	}

}
