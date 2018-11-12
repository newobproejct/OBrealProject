package com.ob.command;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

public class AgreeCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 약관 및 동의 커맨드
		String path = "agree.jsp";
		
		return path;
	}

}
