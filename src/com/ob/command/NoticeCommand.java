/* ******************************************************
 ************* 공지사항 게시판 커맨드 **************************
 ********************************************************/

package com.ob.command;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ob.dao.DAO;

import com.ob.mybatis.PagingNotice;
import com.ob.vo.BoardplusVO;

public class NoticeCommand implements Command {
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String board_type = request.getParameter("board_type");
		
		/* **** 페이징 처리 ***************************************/
		PagingNotice p = new PagingNotice();	//페이징을 위한 PagingNotice 객체 생성
		
		String cNoticePage = request.getParameter("cNoticePage");
		if (cNoticePage != null) {
			p.setNowPage(Integer.parseInt(cNoticePage));
		}
		
		p.setTotalRecord(DAO.totalCount(board_type));
		p.setTotalPage();
		
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		p.setBeginPage((p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		map.put("board_type", Integer.parseInt(request.getParameter("board_type")));
		
		System.out.println(request.getParameter("board_type"));

		List<BoardplusVO> list = DAO.getList(map);
		
		request.setAttribute("list", list);
		request.setAttribute("cNoticePage", cNoticePage);
		request.setAttribute("noticePvo", p);
		
		String path = "notice.jsp";
		return path;
	}

}
