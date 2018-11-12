package com.ob.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.Si_GuVO;

public class SearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// ------------사용하는 코드
		List<Si_GuVO> list = DAO.getAddress();
		System.out.println("SI_GU : " + list);
		request.getSession().setAttribute("addressList", list);
		List<String> si = DAO.getsi();
		request.getSession().setAttribute("si", si);
		// -------------------------------------------------
		////////////////
		// 테마구하기
		List<String> theme = DAO.gettheme();
		request.getSession().setAttribute("theme", theme);
		

		return "search_main.jsp";
	}

}

/*
 * ----------연습용--- 사용하지는 않음 List<String> gu = DAO.getgu(); Map<String, Object>
 * result = new HashMap<>();
 * 
 * 
 * for(int i = 0 ; i<si.size();i++) { String name = si.get(i); List<String> gu2
 * = DAO.getgu2(name); result.put(name, (List<String>)gu2);
 * System.out.println(gu2); } System.out.println(result);
 * 
 * 
 * request.getSession().setAttribute("gu", gu); System.out.println("si : "+ si);
 * System.out.println("gu : "+ gu); request.getSession().setAttribute("si_gu",
 * result);
 */
