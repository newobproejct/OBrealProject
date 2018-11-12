package com.ob.mybatis;

// ONLY!! 게시판의 페이징 처리를 위한 값을 저장 관리
public class PagingNotice {
	private int nowPage = 1;	// 현재 페이지
	private int nowBlock = 1;	// 현재 블록(페이지를 담는 단위) / block 값을 가지고 표시할 페이지를 계산하기 위하여 지정한 값
	
	private int numPerPage = 5;	// 하나의 페이지에 게시되는 게시글의 갯수 / 하나의 페이지에 몇 개의 게시글을 보여줄 것인지를 설정한 값
	private int pagePerBlock = 5;	// 블록당 표시하는 페이지의 갯수(기준이됨)
	
	private int totalRecord = 0;	// 총 게시물에 대한 갯수(원본 게시글의 수)
	private int totalPage = 0;	// 전체 페이지의 갯수
	private int totalBlock = 0;	// 전체 블록의 갯수
		
	private int begin = 0;	// 현재 페이지상의 시작 글 번호(동적 생성한 row번호)
	private int end = 0;	// 현재 페이지상의 끝 글 번호(동적 생성한 row번호)
	
	private int beginPage = 0;	// 현재 블록의 시작 페이지 번호
	private int endPage = 0;	// 현재 블록의 끝 페이지 번호
	
	// 전체 페이지 구하기 METHOD
	// totalRecord 값을 페이지당 표시할 글의 갯수 값(numPerPage)으로 나누고, 나머지가 있으면 페이지 하나 더 추가
	public void setTotalPage() {
		totalPage = totalRecord / numPerPage;
		if (totalRecord % numPerPage != 0) {
			totalPage++;
		}
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
}
