package com.ob.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ob.dao.DAO;
import com.ob.mybatis.PagingNotice;
import com.ob.vo.RoomTABLEVO;

public class SearchThemeCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String chk_theme  = request.getParameter("chk_theme");
		
		if(chk_theme == null) {
		HttpSession session = request.getSession();
		chk_theme = (String) session.getAttribute("chk_theme");
		}
		

		System.out.println("----> chk_theme : " + chk_theme);
		// 페이징 처리를 위한 객체 생성
		PagingNotice p = new PagingNotice();
		p.setNumPerPage(3);// 페이지당 6개
		// p.setPagePerBlock(5); //블록에 몇개 표시할지

		System.out.println(DAO.themeCount(chk_theme));
		p.setTotalRecord(DAO.themeCount(chk_theme));
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
		/////
		Map<String, String> map = new HashMap<>();
		map.put("begin", String.valueOf(p.getBegin()));
		map.put("end", String.valueOf(p.getEnd()));

		map.put("chk_theme", chk_theme);
		System.out.println(map);
		List<RoomTABLEVO> list = DAO.getRoomTheme(map);
		System.out.println(list);
		// request.getSession().setAttribute("getRoomimp", list);
		request.getSession().setAttribute("pvo", p);
		request.getSession().setAttribute("getRoomthemeimp", list);
		request.getSession().setAttribute("chk_theme", chk_theme);
		return "themelist.jsp";
	}

}