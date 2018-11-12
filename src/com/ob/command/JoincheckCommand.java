package com.ob.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.UserVO;

public class JoincheckCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String account = request.getParameter("id"); // id
		String password = request.getParameter("pwd");
		String nickname = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String zipcode = request.getParameter("zipcode");
		String address1 = request.getParameter("address");
		String address2 = request.getParameter("detail");
		String email = request.getParameter("email");
		int e_confirm = Integer.parseInt(request.getParameter("e_confirm"));
		String tel = request.getParameter("tel");

		// get은 가져오는것 set은 저장하는것
		UserVO vo = new UserVO();

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
		System.out.println("vo : " + vo);
		DAO.checkJoin(vo); // dao에 있는 체크조인메소드를 호출하고, 매개변수부에 vo를 넣어줌

		return "controller?type=main";
	}

}
