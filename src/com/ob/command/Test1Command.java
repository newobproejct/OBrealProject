package com.ob.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.command.Command;

public class Test1Command implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "test1.jsp";
	}

}
