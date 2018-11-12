package com.ob.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.command.Command;
import com.ob.dao.DAO;
import com.ob.vo.BoardplusVO;
import com.ob.vo.ReservationVO;
import com.ob.vo.UserVO;

public class LoginCheckCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String result="";
		
		System.out.println("입력된 id 값 " +id +"입력된 pw값 "+ pwd);
		UserVO uvo = DAO.checkId(id);
		
		if(uvo==null) {
			result = "loginFailed.jsp?errorType=nullId";
		} else {
			String pwd1 = uvo.getPassword();
			if(!pwd.equals(pwd1)) {			//java에서는 String 값의 비교에서 ==이 아닌 equals를 사용해야 한다.
				result = "loginFailed.jsp?errorType=wrongPwd";
			} else {
				result = "main.jsp";
//				System.out.println("uvo: " + uvo);
//				System.out.println("여기까진왔나");
				//request.getSession().setAttribute("account", id);
				//request.getSession().setAttribute("pwd", pwd);
				request.getSession().setAttribute("uservo", uvo);
				
				List userResList =  DAO.getUserReservation(uvo.getId());
				List getUsedResDetail = DAO.getUsedResDetail(uvo);
				System.out.println("userResList : " + userResList);
				System.out.println("getUsedResDetail : " + getUsedResDetail);
				
				request.getSession().setAttribute("userReservationvo",userResList);
				request.getSession().setAttribute("getUsedResDetail",getUsedResDetail);
				//UserVO uvo2 = (UserVO)request.getSession().getAttribute("uservo");
				//String id3 = uvo2.getAccount();
				
				//--김재현 추가부분
				//--> 유저 고유 id 번호에 대한 boardplusVO 리스트로 전체 보기
			request.getSession().setAttribute("userboardtotalList", DAO.getUserBoardTotalList(uvo.getId()));
				//--
			}
		}
		return result;
		
		
		/*
		if(uvo==null) return "loginFailed.jsp?errorType=nullId";
		
		String pwd1 = uvo.getPassword();
		
		if(!pwd.equals(pwd1)) return "loginFailed.jsp?errorType=wrongPwd";
		
		result = "main.jsp";
		
		request.getSession().setAttribute("uservo", uvo);
		
		return result;
		*/
	}

}
