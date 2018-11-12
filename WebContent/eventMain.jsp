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
			<jsp:include page="eventBody.jsp"></jsp:include>
		</article>
	</section>



	<!-- -----------------------------------------------------------------  ------------------------ -->
	<footer>
		<jsp:include page="/footer.jsp"></jsp:include>
	</footer>

</body>
</html>
