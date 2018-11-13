package com.ob.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddAddCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String room_id = request.getParameter("room_id"); // RoomVO 에서 id에 해당
		String room_type_id = request.getParameter("room_type_id");
		String room_name = request.getParameter("room_name");
		String room_num = request.getParameter("room_num");
		String room_content = request.getParameter("room_content");
		String room_address1 = request.getParameter("room_address1");
		String room_address2 = request.getParameter("room_address2");
		String room_theme = request.getParameter("room_theme");
		
		System.out.println("받은 :room_id : " + room_id);
		System.out.println("받은 :room_type_id : " + room_type_id);
		System.out.println("받은 :room_name : " + room_name);
		System.out.println("받은 :room_num : " + room_num);
		System.out.println("받은 :room_content: " + room_content);
		System.out.println("받은 :room_address1 : " + room_address1);
		System.out.println("받은 :room_address2 : " + room_address2);
		System.out.println("받은 :room_theme : " + room_theme);

	


		return "NewKim.jsp";
	}

}
