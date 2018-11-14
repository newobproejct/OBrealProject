package com.ob.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.ReservationVO;
import com.ob.vo.RoomTABLEVO;
import com.ob.vo.UserVO;

public class ReservationOkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {
		UserVO uvo = (UserVO)request.getSession().getAttribute("uservo");
		System.out.println("uvo : " + uvo);
		String user_id = uvo.getId();
		System.out.println("user_id : " + user_id);
		
		RoomTABLEVO rvo = (RoomTABLEVO)request.getSession().getAttribute("roomTable");
		request.getSession().removeAttribute("roomTable");
		System.out.println("rvo : " + rvo);
		
		String room_id = rvo.getRoom_id();
		System.out.println("room_id : " + room_id);
		
		String s_date = request.getParameter("s_date");
		String e_date = request.getParameter("e_date");
		String pax = request.getParameter("pax");
		String total_cost = request.getParameter("total_cost");
		System.out.println("s_date : " + s_date);
		System.out.println("e_date : " + e_date);
		System.out.println("pax : " + pax);
		System.out.println("total_cost : " + total_cost);
		
		ReservationVO resvo = new ReservationVO();
		
		resvo.setId("0");
		resvo.setUser_id(user_id);
		resvo.setRoom_id(room_id);
		resvo.setS_date(s_date);
		resvo.setE_date(e_date);
		resvo.setPax(pax);
		resvo.setReview_id("0");
		resvo.setTotal_cost("000");
		
		System.out.println(resvo);
		
		int result = DAO.insertReservation(resvo);
		
		/*response.setContentType("text/html; charset=UTF-8");
		 
		PrintWriter out = response.getWriter();
		 
		out.println("<script>alert('예약이 완료되었습니다.');</script>");
		out.flush();*/

		return "revList.jsp";
	}

}
