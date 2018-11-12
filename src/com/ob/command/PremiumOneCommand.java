package com.ob.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.command.Command;
import com.ob.dao.DAO;
import com.ob.vo.BoardplusVO;

public class PremiumOneCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String pId = request.getParameter("pId");
		
		BoardplusVO premOneVO = DAO.getPremOne(pId);
		Map<String,String> map = DAO.getPremRoomDetail(pId);
		
		System.out.println("premOneVO : " + premOneVO);
		System.out.print("map : " + map);
		
		request.setAttribute("pId", pId);
		request.setAttribute("premOneVO", premOneVO);
		request.setAttribute("premRoomMap", map);
		
		return "premiumOne.jsp";
	}

}
