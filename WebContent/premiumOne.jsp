<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프리미엄 리뷰</title>
</head>
<body>
<div id="premOneHeader">
	<a href="controller?type=premOneMod">수정</a>
	<a href="controller?type=premOneDel">삭제</a>
	<a href="controller?type=premium&board_type=4&cPremPage=${premPvo.nowPage }">목록으로</a>
</div>
<div id="premOneContainer">
	<div id="premOneTitleBox">${premOneVO.title }</div>
	<div id="premOneWriter">${premOneVO.nickname }(${premOneVO.account })</div>
	<div id="premOneDetailBox">${premRoomMap.ROOM_NAME }(${premRoomMap.ROOM_ADDRESS1 } ${premRoomMap.ROOM_ADDRESS2 })<br>
							${premRoomMap.ROOM_TYPE } (사용인원:${premRoomMap.PAX }/총 수용가능인원:${premRoomMap.MAX_PAX })<br>
							숙박날짜 : ${premRoomMap.S_DATE } ~ ${premRoomMap.E_DATE }</div>
	<div id="premOneImgBox"></div>
	<div id="premOneContent">${premOneVO.content }</div>
</div>

</body>
</html>