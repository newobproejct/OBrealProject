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
		System.out.println("room_id : " + room_id);
		RoomTABLEVO roomTable= DAO.getRoomTableByRid(room_id);
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
		
		Calendar cal = Calendar.getInstance();
		
		Map<String, Date> resDateMap = new HashMap<>();
		List<String> dates = new ArrayList<String>();
		
		if(!list.isEmpty()) {
			for(ReservationVO resvo : list) {
				s_dateString = resvo.getS_date();
				e_dateString = resvo.getE_date();
				
				try {
					s_date = format.parse(s_dateString);
					e_date = format.parse(e_dateString);
				} catch (ParseException e) {
				}
			        
		        while (s_date.compareTo(e_date) <= 0) {
		            dates.add(format.format(s_date));
		            cal.setTime(s_date);
		            cal.add(Calendar.DAY_OF_MONTH, 1);
		            s_date = cal.getTime();
		        }
			}
		}
		
		System.out.println("dates : " + dates);
		request.setAttribute("dates", dates);
		request.getSession().setAttribute("roomTable", roomTable);
		System.out.println("roomTable : " + roomTable);
		
		/* **********************************************************/
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal2 = Calendar.getInstance();
		String nowDate="";
		List<String> enableDates = new ArrayList<>(); 
				
		//이번달
		int year = cal2.get(Calendar.YEAR);
	    int mon = cal2.get(Calendar.MONTH)+1;
	    int day = cal2.get(Calendar.DAY_OF_MONTH);
	    System.out.println("day:" + day);
	    int startDate = day;
	    int firstday = 1;
	    int lastday = cal.getActualMaximum(Calendar.DATE);
	    
	    //다음달
	    cal.set(year, mon, day);
		int year2 = cal.get(Calendar.YEAR);
	    int mon2 = cal.get(Calendar.MONTH)+1;
	    int day2 = cal.get(Calendar.DATE);
	    int startDate2 = startDate;
	    int lastday2 = cal.getActualMaximum(Calendar.DATE);
		

	    
	    //이번달 처리
	    for(int i=startDate; i<=lastday; i++){
        	nowDate = year + "-" + mon + "-" + i;
        	if(!dates.contains(nowDate)){
        		enableDates.add(nowDate);
     	  	};
        };
        
        //다음달 처리
        for(int i=firstday; i<=lastday2; i++){
        	nowDate = year2 + "-" + mon2 + "-" + i;
        	if(!dates.contains(nowDate)){
        		enableDates.add(nowDate);
     	  	};
        };
        
        System.out.println("enableDates: " + enableDates);
        request.setAttribute("enableDates", enableDates);
        
		return "reservation.jsp";
	}

}
