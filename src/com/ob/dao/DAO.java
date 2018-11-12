package com.ob.dao;

import java.util.HashMap;
import java.util.List; 
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ob.mybatis.DBService;
import com.ob.vo.BoardplusVO;
import com.ob.vo.ReservationVO;
import com.ob.vo.RoomTABLEVO;
import com.ob.vo.Si_GuVO;
import com.ob.vo.UserVO;

public class DAO {
	private static SqlSession ss;

	// 싱글턴패턴 : 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		if (ss == null) {
			ss = DBService.getFactory().openSession(true);
		}
		return ss;
	}

	/* **** 로그인, 회원가입 **********************************************/
	// 아이디값 조회
	public static UserVO checkId(String account) {

		return getSql().selectOne("checkId", account);

	}
	
	//로그인 한 유저의 예약기록 전체 조회
	public static List<ReservationVO> getUserReservation(String id) {
		return getSql().selectList("getUserReservation", id);
	}
	

	// 회원가입 insert
	public static int checkJoin(UserVO vo) {
		return getSql().insert("checkJoin", vo);
	}

	/* *****************************************************************/

	/* **** 게시판 공용 ***************************************************/

	// 게시판별 전체 게시물 조회
	public static List<BoardplusVO> getAllList(String board_type) {
		return getSql().selectList("getList", board_type);
	}

	//게시판별 총 게시물 건수 조회
	public static int totalCount(String board_type) {
		int totalCount = getSql().selectOne("totalCount", board_type);
		return totalCount;
	}
	
	// 게시판 페이지별 목록조회
	public static List<BoardplusVO> getList(Map map) {
		return getSql().selectList("getPageList", map);
	}

	//프리미엄 후기용 페이지별 게시글 목록조회
	public static List<BoardplusVO> getPremPageList(Map map){
		return getSql().selectList("getPremPageList", map);
	}
	
	//프리미엄 후기용 게시글 상세조회
	public static BoardplusVO getPremOne(String pId) {
		return getSql().selectOne("getPremOne",pId);
	}
	
	//프리미엄 후기용 게시글 방정보 상세조회
	public static Map<String,String> getPremRoomDetail(String review_id){
		return getSql().selectOne("getPremRoomDetail", review_id);
	}
	
	//프리미엄 후기용 예약내역 상세조회
	public static List<ReservationVO> getUsedResDetail(UserVO uvo){
		return getSql().selectList("getUsedResDetail",uvo);
	}
	
	// 공지사항 게시물 작성
	public static int noticeInsert(BoardplusVO vo) {
		int result = getSql().insert("noticeInsert", vo);
		getSql().commit();
		return result;
	}

	// 공지사항 조회수
	public static int noticeHit(int id) {
		return getSql().update("noticeHit", id);
	}

	// 공지사항 게시물 보기
	public static BoardplusVO noticeSelOne(String id) {
		BoardplusVO vo = getSql().selectOne("noticeOne", id);
		return vo;
	}

	// 공지사항 게시물 삭제
	public static int noticeDel(String id) {
		int result = getSql().delete("noticeDel", id);
		getSql().commit();
		return result;
	}

	// 공지사항 게시물 수정
	public static int noticeUp(BoardplusVO vo) {
		int result = getSql().update("noticeUp", vo);
		getSql().commit();
		return result;
	}

	// 문의사항 게시물 보기
	public static List<BoardplusVO> queSelect(Map<String, Integer> map) {
		List<BoardplusVO> list = getSql().selectList("queList", map);
		return list;
	}

	// 문의사항 게시물 작성
	public static int queInsert(BoardplusVO vo) {
		int result = getSql().insert("queInsert", vo);
		getSql().commit();
		return result;
	}

	// 문의사항 게시물보기
	public static BoardplusVO queSelOne(String id) {
		BoardplusVO vo = getSql().selectOne("queSelOne", id);
		return vo;
	}

	// boardVOplus 모든 이벤트 데이터값 불러오기
	public static List<BoardplusVO> getEventALLList(Map<String, Integer> map) {
		return getSql().selectList("getEventALLcol", map);
	}

	public static List<BoardplusVO> getUserBoardTotalList(String id) {
		return getSql().selectList("getUserBoardTotalList", id);
	}

	// 파일 데이타 입력 처리
	public static int insert(BoardplusVO bvo) {
		return getSql().insert("file_insert", bvo);
	}

	public static BoardplusVO getDeatil(String b_id) {
		return getSql().selectOne("getDeatil", b_id);
	}

	// 김재현 전체검석 지역 시 받아오기
	public static List<String> getsi() {
		return getSql().selectList("getsi");
	}

	// 김재현 전체검석 지역 구 받아오기
	public static List<String> getgu() {
		return getSql().selectList("getgu");
	}

	public static List<String> getgu2(String name) {
		System.out.println("DAO name 값: " + name);

		return getSql().selectList("getgu2", name);

	}
	
	public static int siguCount(Map<String, String> map5) {
		int siguCount = getSql().selectOne("siguCount", map5);
		return siguCount;
	}

	public static List<RoomTABLEVO> getROOMALL(Map<String, String> map) {

		return getSql().selectList("get_room", map);
	}

	public static List<String> gettheme() {
		return getSql().selectList("gettheme");
	}

	public static int themeCount(String chk_theme) {
		return getSql().selectOne("themeCount",chk_theme);
	}
	public static List<RoomTABLEVO> getRoomTheme(Map<String, String> map) {

		return getSql().selectList("get_Roomtheme", map);
	}

	public static List<Si_GuVO> getAddress() {

		return getSql().selectList("get_Address");
	}
}
