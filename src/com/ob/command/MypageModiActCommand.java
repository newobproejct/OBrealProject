<<<<<<< HEAD
package com.ob.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.UserVO;

public class MypageModiActCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String chk = request.getParameter("chk");
		
		String id = request.getParameter("idx");
		String account = request.getParameter("id");
		String password = request.getParameter("pwd");
		String nickname = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String zipcode = request.getParameter("zipcode");
		String address1 = request.getParameter("address");
		String address2 = request.getParameter("detail");
		String email = request.getParameter("email");
		int e_confirm = Integer.parseInt(request.getParameter("e_confirm"));
		String tel = request.getParameter("tel");
		
		String path = null;
		
		if (chk == null) {
			path = "myPageModi.jsp";
		} else {
			UserVO vo = new UserVO();
			
			vo.setId(id);
			vo.setAccount(account);
			vo.setPassword(password);
			vo.setNickname(nickname);
			vo.setBirthday(birthday);
			vo.setZipcode(zipcode);
			vo.setAddress1(address1);
			vo.setAddress2(address2);
			vo.setEmail(email);
			vo.setE_confirm(e_confirm);
			vo.setTel(tel);
			
			DAO.mypageUP(vo);
		
			path = "controller?type=main";
		}
		return path;
	}

}
=======
package com.ob.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ob.dao.DAO;
import com.ob.vo.UserVO;

public class MypageModiActCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String chk = request.getParameter("chk");
		
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO)session.getAttribute("uservo");
		String id = uvo.getId();
		
		String account = request.getParameter("id");
		String password = request.getParameter("pwd");
		String nickname = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String zipcode = request.getParameter("zipcode");
		String address1 = request.getParameter("address");
		String address2 = request.getParameter("detail");
		String email = request.getParameter("email");
		int e_confirm = Integer.parseInt(request.getParameter("e_confirm"));
		String tel = request.getParameter("tel");
	
		
		System.out.println("/1/" + account + "/2/" + password + "/3/" + nickname + "/4/" + birthday + "/5/" + zipcode + 
				"/6/" + address1 + "/7/" + address2 + "/8" + email + "/9/" + e_confirm + "/10/" + tel);
		
		String path = null;
		
		if (chk == null) {
			path = "myPageModi.jsp";
		} else {
			
			UserVO vo = new UserVO();
			
			vo.setId(id);
			vo.setAccount(account);
			vo.setPassword(password);
			vo.setNickname(nickname);
			vo.setBirthday(birthday);
			vo.setZipcode(zipcode);
			vo.setAddress1(address1);
			vo.setAddress2(address2);
			vo.setEmail(email);
			vo.setE_confirm(e_confirm);
			vo.setTel(tel);
			
			DAO.mypageUP(vo);
		
			request.getSession().setAttribute("uVO", vo);
			
			path = "main.jsp";
		}
		return path;
	}

}
>>>>>>> refs/remotes/origin/master
