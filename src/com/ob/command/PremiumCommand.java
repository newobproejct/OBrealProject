/* ******************************************************
 ************* 프리미엄 후기 게시판 커맨드 **********************
 ********************************************************/

package com.ob.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.mybatis.PagingPremium;
import com.ob.vo.BoardplusVO;

public class PremiumCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String board_type = request.getParameter("board_type");
		
		/* **** 페이징 처리 ***************************************/
		PagingPremium p = new PagingPremium();	//페이징을 위한 페이징객체 생성
		
		String cPremPage = request.getParameter("cPremPage");
		if(cPremPage != null){
			p.setNowPage(Integer.parseInt(cPremPage));
		}
			
		p.setTotalReview(DAO.totalCount(board_type));	//전체 리뷰 건수 설정
		p.computeTotalPage();		//전체 페이지 수 계산
		
		p.setEnd(p.getNowPage()*p.getReviewPerPage());	//페이지의 마지막 게시물번호(마지막 게시물부터 구하는 편이 식이 더 간단하므로)
		p.setBegin(p.getEnd()-p.getReviewPerPage()+1);	//페이지의 시작 게시물 번호
		
		p.setBeginPage((p.getNowPage()-1)/p.getPagePerBlock()*p.getPagePerBlock()+1);	//블락의 시작 페이지
		p.setEndPage(p.getBeginPage()+p.getPagePerBlock()-1);	//블락의 끝 페이지
		
		if(p.getEndPage()>p.getTotalPage()) {		//마지막 블락에서 페이지 수가 블락당 페이지 수에 미치치 못하는 경우
			p.setEndPage(p.getTotalPage());			//블락의 마지막 페이지를 실제 마지막 페이지 수와 맞춤
		}
		
		Map<String,Integer> map = new HashMap<>();	//DB 연동 작업(DAO,mapper이용시) 편의를 위해 Map 객체에 시작,끝 값 담음
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		map.put("board_type", Integer.parseInt(board_type));			//게시판 타입(board_type) 또한 집합객체에 넣어서 DAO이용시 따로 파라미터 넘길 필요 없도록
		
		List<BoardplusVO> pPageList = DAO.getPremPageList(map);	//설정한 map파라미터 값으로 페이지의 게시물 목록 불러옴
		
		request.setAttribute("pPageList", pPageList);	//request에 현재 페이지 게시판 목록 저장
		request.setAttribute("cPremPage", cPremPage);	//request에 현재 페이지 값 저장
		request.setAttribute("premPvo", p);
		
		//System.out.println("list : " + request.getAttribute("pList"));
		
		return "premium.jsp";
	}

}
