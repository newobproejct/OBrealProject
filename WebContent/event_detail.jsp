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
#bbs_view table {
    width:580px;
    margin-left:10px;
    border:1px solid black;
    border-collapse:collapse;
    font-size:14px;
}
#bbs_view table caption {
    font-size:20px;
    font-weight:bold;
    margin-bottom:10px;
}
#bbs_view table th {
    text-align:center;
    border:1px solid black;
    padding:4px 10px;
    width: 30%;
    background-color: lightsteelblue;
}
#bbs_view table td {
    text-align:left;
    border:1px solid black;
    padding:4px 10px;
}
#imgsize {
	width: 600px;
	height: 900x;
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
				<li><a href="controller?type=event_roomALL&board_type=2">전체리스트1</a></li>
				<li><a href="controller?type=event2">전체board리스트test</a></li>
				<li><a href="event3.jsp">수정중</a></li>
				<c:if test="${uservo.id eq 1}">
					<li><a href="controller?type=admin_system">관리자모드</a>
				</c:if>

			</ul>
		</nav>

		<article>
			<div id="bbs_view">
				<%-- 게시글 내용 표시 --%>
				<form method="post" name="frm">
					<table>
						<caption>공지사항 상세보기</caption>
						<tbody>
							<tr>
								<td><img id="imgsize"
									src="imgs/${event_detail.filename} "
									alt="${event_detail.title }"></td>
							</tr>


							<tr>
								<th>${event_detail.title }</th>
							</tr>
							<tr>
								<td><pre>${event_detail.content}</pre></td>
							</tr>

							<tr>
								<td colspan="1"><input type="button" value="돌아가기"
								onclick="javascript:location.href='controller?type=event_roomALL&board_type=2'"> 
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</article>
	</section>



	<!-- -----------------------------------------------------------------  ------------------------ -->
	<footer>
		<jsp:include page="/footer.jsp"></jsp:include>
	</footer>

</body>
</html>
