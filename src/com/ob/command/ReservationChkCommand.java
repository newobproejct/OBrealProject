package com.ob.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.vo.ReservationVO;
import com.ob.vo.RoomVO;
import com.ob.vo.UserVO;

public class ReservationChkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {
		RoomVO rvo = (RoomVO)request.getAttribute("roomVO");
		UserVO uvo = (UserVO)request.getSession().getAttribute("uservo");
		
		ReservationVO resvo = new ReservationVO();
		
		uvo.getId();
		rvo.getId();
		return null;
	}

}
