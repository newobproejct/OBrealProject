<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>event.jsp</title>
<meta charset="utf-8">
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
	background-color: #292929; /* #666 */
	padding: 100px; /* --  */
	text-align: center;
	font-size: 35px;
	color: white;
}

/* Create two columns/boxes that floats next to each other */
nav {
	float: left;
	width: 15%;
	height: 400px; /* only for demonstration, should be removed */
	background: #ccc;
	padding: 20px;
}

/* Style the list inside the menu */
nav ul {
	list-style-type: none;
	padding: 0;
}

article {
	float: left;
	padding: 20px;
	width: 85%;
	background-color: #f1f1f1;
	height: auto; /* only for demonstration, should be removed */
}

/* Clear floats after the columns */
section:after {
	content: "";
	display: table;
	clear: both;
}

/****** Style the footer -->css 적용 *********/
/**<link href="./css/footer.css" rel="stylesheet" type="text/css">**/
/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media ( max-width : 600px) {
	nav, article {
		width: 100%;
		height: auto;
	}
}

#bbs table {
	width: 580px;
	margin-left: 10px;
	border: 1px solid black;
	border-collapse: collapse;
	font-size: 14px;
}

#bbs table caption {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 10px;
}

#bbs table th, #bbs table td {
	text-align: center;
	border: 1px solid black;
	padding: 4px 10px;
}

.title {
	background-color: lightsteelblue;
}

.no {
	width: 10%;
}

.writer {
	width: 15%;
}

.regdate {
	width: 15%;
}

.hit {
	width: 15%;
}

/******* 페이지 표시 부분 스타일(시작) *****/
.paging {
	list-style: none;
}

.paging li {
	float: left;
	margin-right: 8px;
}

.paging li a {
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	font-weight: bold;
	color: black;
}

.paging li a:hover {
	background-color: #00B3DC;
	color: white;
}

.paging .disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.paging .now {
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background-color: #ff4aa5;
	color: white;
	font-weight: bold;
}

#event_wrapper li {
	float: left;
	list-style: none;
	margin: 20px;
}

#imgsize {
	width: 200px;
	height: 250px;
}

#title {
	display: block;
}

#contain {
	display: inline-block;
	width: 800px;
	height: 650px;
}
</style>
</head>
<body>

	<jsp:include page="/header.jsp"></jsp:include>
	<header>
		<h2>EVENT게시판</h2>
	</header>
	<!-- -----------------------------------------------------------------  여기까지 살리고 밑에서 부터  내용 만드시면됩니다 -->
	<!-- 내용 쓰는곳 -->

	<section>
		<nav>
			<ul>
			<li><a href="controller?type=event_roomALL&board_type=2">전체목록</a></li>
			
				<c:if test="${uservo.id eq 1}">
					<li><a href="controller?type=admin_system">관리자모드</a>
				</c:if>

			</ul>
		</nav>

		<article>

			<!-- 	style="margin-left: auto; margin-right: auto;" -->
			<div id="contain">
				<ul id="event_wrapper">
					<c:forEach var="vo" items="${list }">
						<li class="item"><a
							href="controller?type=event_detail&b_id=${vo.id }"
							title="event이미지"> <img id="imgsize"
								src="imgs/${vo.filename} " alt="${vo.title }">
						</a>

							<div class="title">${vo.title }</div> <span>${vo.content }</span></li>
						<!-- //이벤트 1개 -->
					</c:forEach>
				</ul>
			</div>





			<hr>
			<div id="center">
				<table style="margin-left: auto; margin-right: auto;">
					<tr>
						<td colspan="4">
							<ol class="paging">
								<%--[이전으로]에 대한 사용여부 처리 --%>
								<c:choose>
									<%-- 사용불가(disable) : 첫번째 블록인 경우 --%>
									<c:when test="${pvo.beginPage == 1 }">
										<li class="disable">이전으로</li>
									</c:when>
									<%--사용가능(enable) : 두번째 이상(첫번째 아닌경우) --%>
									<c:otherwise>
										<li><a
											href="controller?type=event_roomALL&board_type=2&cPage=${pvo.beginPage - 1 }">이전으로</a>
										</li>
									</c:otherwise>
								</c:choose>

								<%-- 블록내에 표시할 페이지 반복처리(시작페이지~끝페이지)--%>
								<c:forEach var="k" begin="${pvo.beginPage }"
									end="${pvo.endPage }">
									<c:choose>
										<c:when test="${k == pvo.nowPage }">
											<li class="now">${k }</li>
										</c:when>
										<c:otherwise>
											<li><a
												href="controller?type=event_roomALL&board_type=2&cPage=${k }">${k }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<%--[다음으로]에 대한 사용여부 처리 --%>
								<c:choose>
									<%--사용불가(disable) : endPage가 전체페이지수 보다 크거나 같으면 --%>
									<c:when test="${pvo.endPage >= pvo.totalPage }">
										<li class="disable">다음으로</li>
									</c:when>
									<%--사용가능(enable) --%>
									<c:otherwise>
										<li><a
											href="controller?type=event_roomALL&board_type=2&cPage=${pvo.endPage + 1 }">다음으로</a>
										</li>
									</c:otherwise>
								</c:choose>
							</ol>
						</td>


					</tr>
				</table>
			</div>






		</article>
	</section>



	<!-- -----------------------------------------------------------------  ------------------------ -->
	<footer>
		<jsp:include page="/footer.jsp"></jsp:include>
	</footer>

</body>
</html>
