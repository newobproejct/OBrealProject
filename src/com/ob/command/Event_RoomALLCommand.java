package com.ob.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.mybatis.PagingNotice;
import com.ob.vo.BoardplusVO;

public class Event_RoomALLCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String board_type = request.getParameter("board_type");
		System.out.println("Event_RoomALLCmmand.java 까지 넘어온 board_type : --->>> " +board_type);
		// 페이징 처리를 위한 객체 생성
			PagingNotice p = new PagingNotice();
		 p.setNumPerPage(6);//페이지당 6개
		// p.setPagePerBlock(5); //블록에 몇개 표시할지

		p.setTotalRecord(DAO.totalCount(board_type));
		p.setTotalPage();// 전체 페이지 갯수 구하기

		// 2. 현재 페이지 구하기 (디폴트 값 1)
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		// 3. 현재페이지의 시작번호 끝번호 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		// 4. 블록의 시작페이지, 끝페이지 번호 구하기(현재페이지 번호 이용)
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

		// 4-1 끝페이지(endPage)가 총페이지(totalPage)보다 크면
		// endPage = totalPage 설정
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}

		// DB글 가져와 써보기
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		map.put("board_type", Integer.parseInt(request.getParameter("board_type")));
		List<BoardplusVO> list = DAO.getEventALLList(map);

		request.setAttribute("list", list);
		request.setAttribute("pvo", p);
		System.out.println("@@"+list);

		return "event_All_List.jsp";
	}

}
