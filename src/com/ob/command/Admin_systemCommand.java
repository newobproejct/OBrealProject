package com.ob.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.command.Command;
import com.ob.dao.DAO;
import com.ob.vo.BoardplusVO;

public class Admin_systemCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String chk = request.getParameter("chk");
		String uId =request.getParameter("user_id");
		String bType = request.getParameter("board_type");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String date = request.getParameter("write_date");
		String count = request.getParameter("read_count");
		
		String path = null;
		
		if (chk == null) {
			path = "admin_system.jsp";
		} else {
			BoardplusVO vo = new BoardplusVO();			
			vo.setUser_id(uId);
			vo.setBoard_type(bType);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setWrite_date(date);
			vo.setRead_count(count);			
			
		int result	= DAO.noticeInsert(vo);
		System.out.println(vo.getBoard_id());

		if(result>=1)
			System.out.println("정상적으로  입력 처리 되었습니다.");
		//System.out.println("입력하신 게시판 번호는 : ["+ +"] 입니다");
			path = "admin_system.jsp";
			//request.getSession().setAttribute("pwd", pwd);
		}
		return path;
	}

}
