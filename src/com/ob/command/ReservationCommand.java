package com.ob.command;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.ReservationVO;
import com.ob.vo.RoomTABLEVO;
import com.ob.vo.RoomVO;
import com.ob.vo.UserVO;

public class ReservationCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String room_id = request.getParameter("room_id"); // RoomVO 에서 id에 해당
		List<RoomTABLEVO> roomTableList= DAO.getRoomTableByRid(room_id);
		List<ReservationVO> list = DAO.getResByRid(room_id);
		
		/* *************************************************************
        final String DATE_PATTERN = "yyyy-MM-dd";
        String inputStartDate = "2018-11-10";
        String inputEndDate = "2018-12-27";
        
        SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
        
        Date startDate = sdf.parse(inputStartDate);
        Date endDate = sdf.parse(inputEndDate);
        
        ArrayList<String> dates = new ArrayList<String>();
        
        Date currentDate = startDate;
        
        while (currentDate.compareTo(endDate) <= 0) {
            dates.add(sdf.format(currentDate));
            Calendar c = Calendar.getInstance();
            c.setTime(currentDate);
            c.add(Calendar.DAY_OF_MONTH, 1);
            currentDate = c.getTime();
        }
         *************************************************************/
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		String s_dateString =""; 
		String e_dateString ="";
		Date s_date = new Date();
		Date e_date = new Date();
		Date[] reserved_date = new Date[] {};
		
		Date today = new Date();
		Calendar cal = Calendar.getInstance();
		
		Map<String, Date> resDateMap = new HashMap<>();
		ArrayList<String> dates = new ArrayList<String>();
		
		if(!list.isEmpty()) {
			for(ReservationVO resvo : list) {
				s_dateString = resvo.getS_date();
				e_dateString = resvo.getE_date();
				
				try {
					s_date = format.parse(s_dateString);
					e_date = format.parse(e_dateString);
				} catch (ParseException e) {
				}
			        
		        Date currentDate = s_date;
		        
		        while (currentDate.compareTo(e_date) <= 0) {
		            dates.add(format.format(currentDate));
		            cal.setTime(currentDate);
		            cal.add(Calendar.DAY_OF_MONTH, 1);
		            currentDate = cal.getTime();
		        }
			}
		}
		
		System.out.println("dates : " + dates);
		
		request.setAttribute("dates", dates);
		request.setAttribute("roomTableList", roomTableList);
		
		return "reservation.jsp";
	}

}
