package com.ob.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PremiumWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 프리미엄 후기 작성페이지 커맨드
		String path = "premiumWrite.jsp";
		return path;
	}

}
