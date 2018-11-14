package com.ob.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.command.Admin_file_systemCommand;
import com.ob.command.Admin_systemCommand;
import com.ob.command.AgreeCommand;
import com.ob.command.Command;
import com.ob.command.CommonCommand;
import com.ob.command.EventAddCommand;
import com.ob.command.Event_DetailCommand;
import com.ob.command.Event_RoomALLCommand;
import com.ob.command.IdCheckCommand;
import com.ob.command.JoinCommand;
import com.ob.command.JoincheckCommand;
import com.ob.command.LocationCommand;
import com.ob.command.LoginCheckCommand;
import com.ob.command.LoginCommand;
import com.ob.command.LogoutCommand;
import com.ob.command.MainCommand;
import com.ob.command.MorequeCommand;
import com.ob.command.MypageCommand;
import com.ob.command.MypageModiActCommand;
import com.ob.command.NoticeCommand;
import com.ob.command.NoticeDelCommand;
import com.ob.command.NoticeModiCommand;
import com.ob.command.NoticeViewCommand;
import com.ob.command.NoticeWriteCommand;
import com.ob.command.PremiumCommand;
import com.ob.command.PremiumOneCommand;
import com.ob.command.PremiumWriteCommand;
import com.ob.command.PremiumWriteRightChkCommand;
import com.ob.command.QueCommand;
import com.ob.command.QueWriteCommand;
import com.ob.command.ReservationCommand;
import com.ob.command.ReservationListCommand;
import com.ob.command.ReservationOkCommand;
import com.ob.command.SearchCommand;
import com.ob.command.SearchListCommand;
import com.ob.command.SearchThemeCommand;
import com.ob.command.Test1Command;
import com.ob.command.Test2Command;
import com.ob.command.queModiCommand;
import com.ob.command.queViewComand;



@WebServlet("/controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		
		// ----------------------------------------------- 나중에 지우기
		System.out.println("Controller.java 까지 넘어온 type: --->>  " + type);
		System.out.println("Controller.java 까지 넘어온 board_type: --->>  "+request.getParameter("board_type"));
		// -----------------------------------------------
		String path = "";
		Command comm = null;

		if (type.equals("notice")) {
			comm = new NoticeCommand();
		} else if (type.equals("moreQue")) {
			comm = new MorequeCommand();
		} else if (type.equals("que")) {
			comm = new QueCommand();
		} else if (type.equals("premium")) {
			comm = new PremiumCommand();
		} else if (type.equals("premiumWriteRightChk")) {
			comm = new PremiumWriteRightChkCommand();
		} else if (type.equals("premiumWrite")) {
			comm = new PremiumWriteCommand();
		} else if (type.equals("premiumOne")) {
			comm = new PremiumOneCommand();
		} else if (type.equals("agree")) {
			comm = new AgreeCommand();
		} else if (type.equals("location")) {
			comm = new LocationCommand();
		} else if (type.equals("event")) {
			comm = new CommonCommand(type);
		} else if (type.equals("main")) {
			comm = new MainCommand();
		} else if (type.equals("login")) {
			comm = new LoginCommand();
		} else if (type.equals("loginCheck")) {
			comm = new LoginCheckCommand();
		} else if (type.equals("logout")) {
			comm = new LogoutCommand();
		} else if (type.equals("test1")) {
			comm = new Test1Command();
		} else if (type.equals("test2")) {
			comm = new Test2Command();
		} else if (type.equals("loca")) {
			comm = new CommonCommand(type);
		} else if (type.equals("priv")) {
			comm = new CommonCommand(type);
		} else if (type.equals("noticeWrite")) {
			comm = new NoticeWriteCommand();
		} else if (type.equals("join")) {
			comm = new JoinCommand();
		} else if (type.equals("joincheck")) {
			comm = new JoincheckCommand();
		} else if (type.equals("noticeView")) {
			comm = new NoticeViewCommand();
		} else if (type.equals("noticeDel")) {
			comm = new NoticeDelCommand();
		} else if (type.equals("event_roomALL")) {
			comm = new Event_RoomALLCommand();
		} else if (type.equals("event_add_go")) {
			comm = new EventAddCommand();
		} else if (type.equals("queWrite")){
			comm = new QueWriteCommand();
		} else if (type.equals("noticeModi")) {
			comm = new NoticeModiCommand();
		} else if (type.equals("admin_system")) {
			comm = new Admin_systemCommand();
		} else if (type.equals("admin_system_add_go")){
			comm = new CommonCommand(type);
		} else if (type.equals("admin_system_addfile_go")){
			comm = new CommonCommand(type);
		} else if (type.equals("admin_add_file")){
			comm = new Admin_file_systemCommand();
		} else if (type.equals("event_detail")){
			comm = new Event_DetailCommand();
		} else if (type.equals("queView")) {
			comm = new queViewComand();
		} else if (type.equals("queModi")) {
			comm = new queModiCommand();
		} else if (type.equals("search")) {
			comm = new SearchCommand();
		} else if (type.equals("search_list")) {
			comm = new SearchListCommand();
		} else if (type.equals("contract")) {
			comm = new CommonCommand(type);
		} else if (type.equals("idCheck")) {
			comm = new IdCheckCommand();
		} else if (type.equals("joincheck")) {
			comm = new JoincheckCommand();
		} else if (type.equals("search_theme")) {
			comm = new SearchThemeCommand();
		} else if (type.equals("logout")) {
			comm = new LogoutCommand();
		} else if (type.equals("myPage")) {
			comm = new MypageCommand();
		} else if (type.equals("myPageModi")) {
			comm = new CommonCommand(type);
		} else if (type.equals("myPageModiAct")) {
			comm = new MypageModiActCommand();
		} else if (type.equals("reservation")) {
			comm =new ReservationCommand();
		} else if (type.equals("revList")) {
			comm =new ReservationListCommand();
		} else if (type.equals("reservationOk")) {
			comm =new ReservationOkCommand();
		}


		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
