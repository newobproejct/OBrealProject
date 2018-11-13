package com.ob.command;

import java.io.IOException; 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ob.dao.DAO;
import com.ob.vo.BoardreplyVO;


public class queCommentsCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String chk = request.getParameter("write_chk");
		HttpSession session =  request.getSession();
		BoardreplyVO uvo = (BoardreplyVO)session.getAttribute("BoardreplyVO");
		String uId1 = uvo.getUser_id();
		String bId = uvo.getBoard_id();
		String content = uvo.getContent();
		String date = uvo.getWrite_date();
		
		System.out.println("chk 되고있니??: --> " + chk);
		System.out.println("uId 너는???: --> " + uId1);
		
		String path = null;
		
		if (chk == null) {
			path = "queView.jsp";
		} else {
			BoardreplyVO vo = new BoardreplyVO();
			
			vo.setUser_id(uId1);
			vo.setBoard_id(bId);
			vo.setContent(content);
			vo.setWrite_date(date);
			
			DAO.queCommentsInsert(vo);
			
			path = "controller?type=queView&board_type=3";
		}
		
		return path;
	}

}
