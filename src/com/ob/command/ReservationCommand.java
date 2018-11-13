package com.ob.command;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.ReservationVO;
import com.ob.vo.RoomVO;
import com.ob.vo.UserVO;

public class ReservationCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {
		RoomVO rvo = (RoomVO)request.getAttribute("roomVO");
		List<ReservationVO> list = DAO.getResByRid(rvo.getId());
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		String s_dateString =""; 
		String e_dateString ="";
		Date s_date = new Date();
		Date e_date = new Date();
		Date[] reserved_date = new Date[] {};
		
		Date today = new Date();
		Calendar cal = Calendar.getInstance();
		
		Map<String, Date> resDateMap = new HashMap<>();
		
		if(!list.isEmpty()) {
			for(ReservationVO resvo : list) {
				s_dateString = resvo.getS_date();
				e_dateString = resvo.getE_date();
				
				try {
					s_date = format.parse(s_dateString);
					e_date = format.parse(e_dateString);
					
					resDateMap.put("s_date", s_date);
					resDateMap.put("e_date", e_date);
					
				} catch (ParseException e) {
				}
				
				/*for(Date d=s_date ; d.compareTo(e_date)<0 ; cal.add(cal.d, 1) ) {
					
				}*/
			}
		}
		request.setAttribute("rvo", rvo);
		return "reservation.jsp";
	}

}
