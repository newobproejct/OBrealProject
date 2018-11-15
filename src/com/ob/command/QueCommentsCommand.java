package com.ob.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ob.dao.DAO;
import com.ob.vo.BoardreplyVO;
import com.ob.vo.UserVO;


public class QueCommentsCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		String idx = (String) session.getAttribute("account");
		System.out.println("idx : " + idx);
		
		String bId = "2";
				
		System.out.println("bId 되고있니??: --> " + bId);
		
		UserVO uvo = (UserVO)request.getSession().getAttribute("uservo");
		String uId = uvo.getId();
		System.out.println("uId 되고있니??: --> " + uId);
		
		String content = request.getParameter("content");
		System.out.println("content 되고있니??: --> " + content);
		String date = request.getParameter("Write_date");
				
		System.out.println("date 되고있니??: --> " + date);
		
		
		
		
		String path = null;
		
		if (idx == null) {
			path = "queView.jsp";
		} else {
			BoardreplyVO vo = new BoardreplyVO();
			
			vo.setId(idx);
			vo.setBoard_id(bId);
			vo.setUser_id(uId);
			vo.setContent(content);
			vo.setWrite_date(date);
			
			DAO.queCommentsInsert(vo);
			request.setAttribute("vo", vo);
			  
			path = "controller?type=queView&board_type=3";
			
			
		}
		
		return path;
	}

}
