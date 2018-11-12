<%@page import="com.ob.vo.UserVO"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.ob.vo.ReservationVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>PREMIUM.JSP</title>
<meta charset="utf-8">
<title>프리미엄 리뷰 목록</title>

<style>
	nav a {
		text-decoration: none;
	}
	#li4 {
		font-size: 2em;
		font-weight: bold;
	}
</style>

<link href="./css/premium.css" rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(function(){
		console.log("${chk}");
		if("${chk}"=="0"){
			alert("로그인 후 이용해 주시기 바랍니다.");
			location.href="controller?type=login";
		} else if("${chk}"=="1"){
			alert("숙소를 이용한 사용자만 후기 작성이 가능합니다.");
		} else if("${chk}"=="2"){
			alert("숙소를 이용한 사용자만 후기 작성이 가능합니다.");
		} else if("${chk}"=="-1"){
			alert("[ERROR] 다시 시도해 주십시오.");
		}
	})
</script>
</head>

<!-- ******* <body> 영역 시작******************************** -->
<body>

<jsp:include page="header.jsp"></jsp:include>

<header>
	<h2>프리미엄 후기</h2>
</header>

<section>
	<nav>
		<ul>
			<li><a href="controller?type=notice&board_type=1">공지사항</a></li>
			<li><a href="controller?type=moreQue">자주 묻는 질문</a></li>
			<li><a href="controller?type=que&board_type=3">문의사항</a></li>
			<li id="li4">프리미엄 후기</li>
			<li><a href="controller?type=agree">약관 및 동의사항</a></li>
		</ul>
	</nav>
	
<!-- ******프리미엄 후기 본문********************* -->
	<article>
	
		<%-- ***[게시글목록]******************--%>
		<div id="container">
			<ul>
				<c:if test="${not empty pPageList }">
					<c:forEach var="p" items="${pPageList }">
						<li id="pcontentLi">
						<div id="pcontentDiv">
							<a id="pImg" href="controller?type=premiumOne&board_type=4&cPremPage=${premPvo.nowPage }&pId=${p.id }"><img src="" alt="썸네일이미지"></a>
							<a id="pTitle" href="controller?type=premiumOne&board_type=4&cPremPage=${premPvo.nowPage }&pId=${p.id }"><p>${p.title }</p></a>
							<div id="pcontentInfo">
								<span id="pWriter">${p.nickname }(${p.account })</span><br>
								<span id="pUsedate">숙박기간 : ${p.s_date } ~ ${p.e_date }</span><br>
								
								<span id="pTag">#태그1 #태그2 #태그3</span><br>
								<span id="pRegdate">작성일 : ${p.write_date }</span><br>
							</div>
						</div>
						</li>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty pPageList }">
					<li>
						<h1>작성된 프리미엄 후기가 없습니다.</h1>
					</li>
				</c:if>
			</ul>
		</div>
		
		<%-- ***[버튼란]******************--%>
			<table id="buttons">
				<tr>
					<td></td>
					<td id="pages" colspan="3">
						<ol class="paging">
							<%--[이전으로]에 대한 사용여부 처리  --%>
							<c:choose>
							<%-- 사용불가(disalbe) : 첫번째 블록인 경우 --%>
								<c:when test="${premPvo.beginPage == 1}">
								</c:when>
							<%--사용가능(enable) : 두번째 이상(첫번째가 아닌 경우) --%>
								<c:otherwise>
									<li>
									<a href="controller?type=premium&board_type=4&cPremPage=1">◀◀</a>
									</li>
									<li>
									<a href="controller?type=premium&board_type=4&cPremPage=${premPvo.beginPage - 1 }">◀</a>
									</li>
								</c:otherwise>
							</c:choose>
							
								
							<%-- 블록 내에 표시할 페이지 반복처리 --%>
							<%-- 현재블록 시작페이지~ 끝페이지 표시 --%>
							<c:forEach var="k" begin="${premPvo.beginPage}" end="${premPvo.endPage }">
							<c:choose>
								<c:when test="${k == premPvo.nowPage }">
									<li class="now">${k}</li>
								</c:when>
								<c:otherwise>
									<li>
										<a href="controller?type=premium&board_type=4&cPremPage=${k}">${k}</a>
									</li>
								</c:otherwise>
							</c:choose>
							</c:forEach>
							
							<%--[다음으로]에 대한 사용여부 처리 --%>
							<c:choose>
							<%--사용불가(disable) : endPage가 totalPage 보다  크거나 같으면 --%>
								<c:when test="${premPvo.endPage >= premPvo.totalPage }">
								</c:when>
							<%--사용가능(enable) --%>
								<c:otherwise>
								<li>
									<a href="controller?type=premium&board_type=4&cPremPage=${premPvo.endPage + 1 }">▶</a>
								</li>
								<li>
									<a href="controller?type=premium&board_type=4&cPremPage=${premPvo.totalPage}">▶▶</a>
								</li>
								</c:otherwise>
							</c:choose>
						</ol>
					</td>
					<td id="writeButtonTd">
						<a id="writeButton" href="controller?type=premiumWriteRightChk&board_type=4&writeChk=1")>글쓰기</a>
					</td>
				</tr>	
			</table>
	</article>
	
<!-- *************************************************** -->
</section>

<!-- -----------------------------------------------------------------  ------------------------ -->

<footer>
	<jsp:include page="footer.jsp"></jsp:include>
</footer>

</body>
</html>
