package com.ob.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.command.Command;
import com.ob.command.XMLCommand;

@WebServlet("/MyControllerXML")
public class MyControllerXML extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 응답할때 한글이 있을 경우 한글처리
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		Command comm = new XMLCommand();
		String result = comm.exec(request, response);
		out.println(result);

		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
