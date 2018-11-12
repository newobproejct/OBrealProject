package com.ob.command;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.vo.ReservationVO;
import com.ob.vo.UserVO;

public class PremiumWriteRightChkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		UserVO uvo = (UserVO)request.getSession().getAttribute("uservo");
		List<ReservationVO> rvoList = (List<ReservationVO>)request.getSession().getAttribute("userReservationvo");
		List<ReservationVO> getUsedResDetail = (List<ReservationVO>)request.getSession().getAttribute("getUsedResDetail");
		//List<ReservationVO> rvoUsedList =new ArrayList<>();
		
		System.out.println("UserVO : " + uvo);
		System.out.println("List<ReservationVO> : " + rvoList);
		
		if(uvo==null) {
			System.out.println("chk==0");
			request.setAttribute("chk", 0);
			return "controller?type=premium&board_type=4";
		}
		if (rvoList.isEmpty()) {
			System.out.println("chk==1");
			request.setAttribute("chk", 1);
			return "controller?type=premium&board_type=4";
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREA);
		boolean resChk = false;
		for(ReservationVO rvo : rvoList){
			Date today = new Date();
			Date e_date = new Date();
			int compare = 0;
			try {
				e_date = df.parse(rvo.getE_date());
			} catch (ParseException e) {
				System.out.println("chk==-1");
				request.setAttribute("chk", -1);
				return  "controller?type=premium&board_type=4";
			}
			compare = today.compareTo(e_date);
			if(compare>=0){
				resChk = true;
				//rvoUsedList.add(rvo);
			}
		}
		
		if(resChk==false) {
			System.out.println("chk==2");
			request.setAttribute("chk", 2);
			return "controller?type=premium&board_type=4";
		} else{
			System.out.println("chk==ok");
			request.setAttribute("rvoUsedList", getUsedResDetail);
			return "controller?type=premiumWrite&board_type=4";
		}
		
	}
}
