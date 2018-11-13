package com.ob.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.UserVO;

public class IdCheckCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String account = request.getParameter("id");
		
		UserVO uVO = DAO.dupIdChk(account);

		request.setAttribute("uVO", uVO);
		
		
//		if (uVO == null) {
//			request.setAttribute("idChk", 1);
////			System.out.println("사용가능한 아이디");
//		} else {
//			request.setAttribute("idChk", 0);
////			System.out.println("사용 불가능한 아이디");
//		}

		return "idCheck.jsp";
	}

}
