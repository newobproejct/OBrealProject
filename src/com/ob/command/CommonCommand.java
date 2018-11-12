package com.ob.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommonCommand implements Command {
	private String type;
	private String path;

	public CommonCommand(String type) {
		super();
		this.type = type;
	}

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		switch (type) {
		case "myPageModi":
			path = "myPageModi.jsp";
			break;
		case "contract":
			path = "contract.jsp";
			break;	
		// 위치기반 서비스 이용약관 페이지
		case "loca":
			path = "loca.jsp";
			break;
		// 개인정보 처리방침 페이지
		case "priv":
			path = "priv.jsp";
			break;

		case "event":
			path = "eventMain.jsp?board_type=2";
			break;

		case "admin_system_add_go":
			path = "admin_system_add_go.jsp";
			break;

		case "admin_system_addfile_go":	
			path = "admin_system_addfile_go.jsp";
			break;
			
		case "admin_system_modify_go":
			path = "admin_system_add_go.jsp";
			break;
		case "admin_system_delete_go":
			path = "admin_system_add_go.jsp";
			break;	
			
		
		}
		return path;

	}
}
