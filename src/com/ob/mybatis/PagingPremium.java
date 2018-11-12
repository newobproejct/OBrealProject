package com.ob.mybatis;

public class PagingPremium{
	private int nowPage = 1;	//현재 페이지 
	private int nowBlock = 1;	//현재 블락
	
	private int reviewPerPage = 6;
	private int pagePerBlock = 5;
	
	private int totalReview = 0;
	private int totalPage  = 0;
	private int totalBlock = 0;
	
	private int begin = 0;
	private int end = 0;
	
	private int beginPage = 0;
	private int endPage = 0;
	

	//전체 페이지 구하기
	public void computeTotalPage() {
		totalPage = totalReview/reviewPerPage;
		if(totalReview%reviewPerPage != 0) totalPage++;
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


	public int getReviewPerPage() {
		return reviewPerPage;
	}


	public void setReviewPerPage(int reviewPerPage) {
		this.reviewPerPage = reviewPerPage;
	}


	public int getPagePerBlock() {
		return pagePerBlock;
	}


	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}


	public int getTotalReview() {
		return totalReview;
	}


	public void setTotalReview(int totalReview) {
		this.totalReview = totalReview;
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