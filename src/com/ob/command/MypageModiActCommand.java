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


