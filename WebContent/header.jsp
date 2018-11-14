<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>HEADER</title>
<link href="./css/plus.css" rel="stylesheet" type="text/css">
<style>
	
	.hidden{
		display:none;
	}
	.show{
		display:block;
	}
	#myPageDiv{
		position:relative;
	}
	#myPageList{
	    display: none;
	    position: absolute;
	    background-color: #f9f9f9;
	    min-width: 160px;
	    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	    padding: 12px 16px;
	    z-index: 1;
	}
	#myPageDiv:select #myPageList{
		
	}
	#myPageList ul{
		list-style:none;
	}
</style>
<script>
	$(function(){
	    $("#myPageA").click(function(){
	        $("#myPageList").slideToggle("slow");
	    });
	});
</script>
</head>
<style>
	#user {
		color: white;
		text-decoration: underline;
	}
</style>
<body>
	<div class="fixhead">
		<a href="controller?type=main"><img id="logo" src="imgs/bitcamp_logo.png" alt="회사로고"></a>
		<div class="menubar">
			<ul>
				<li><a href="controller?type=test1">TEST1</a></li>
				<li><a href="controller?type=search">전체검색</a></li>
				<li><a href="controller?type=event&board_type=2">이벤트</a></li>
				<li><a href="#" id="current">더보기</a>
					<ul id="dropdown">
						<li><a href="controller?type=notice&board_type=1">공지사항</a></li>
						<li><a href="controller?type=moreQue">자주 묻는 질문</a></li>
						<li><a href="controller?type=que&board_type=3">문의사항</a></li>
						<li><a href="controller?type=premium&board_type=4">프리미엄 후기</a></li>
						<li><a href="controller?type=agree">약관 및 동의사항</a></li>
					</ul></li>
				<c:if test="${empty sessionScope.uservo}">
				<li id="login"><a href="controller?type=login">로그인</a></li>
				</c:if>
				<c:if test="${sessionScope.uservo.getAccount() == 'admin'}">
				<li id="manage"><a href="controller?type=admin_system">관리자</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.uservo}">
				<li id="logout"><a href="controller?type=logout">로그아웃 </a><p id="user">(${sessionScope.uservo.getAccount()}님 반갑습니다.)</p></li>
				<li id="myPage"><a href="controller?type=myPage">마이페이지</a></li>				
				</c:if>
					</ul>
<!-- 				</li> -->
<%-- 				<c:if test="${uservo==null }"> --%>
<!-- 					<li id="login"><a href="controller?type=login">로그인</a></li> -->
<%-- 				</c:if> --%>
<%-- 				<c:if test="${uservo!=null }"> --%>
<!-- 					<li id="myPage"> -->
<!-- 					<div id="myPageDiv"><a href="controller?type=myPage">마이페이지</a> -->
<!-- 						<div id="myPageList"> -->
<!-- 							<ul> -->
<!-- 								<li>내 정보변경</li> -->
<!-- 								<li>내 예약(숙박)내역</li> -->
<!-- 								<li><a href="controller?type=logout">로그아웃</a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					</li> -->
<%-- 				</c:if> --%>
<!-- 			</ul> -->
		</div>
	</div>
</body>
</html>
