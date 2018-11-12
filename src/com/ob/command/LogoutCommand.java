package com.ob.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.command.Command;

public class LogoutCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().invalidate();
		System.out.println(request.getSession().getAttribute("account"));
		System.out.println(request.getSession().getAttribute("uservo"));
		System.out.println(request.getSession().getAttribute("uservo"));
		return "main.jsp";
	}

}
