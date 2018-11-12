<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>test1 페이지입니다</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="utf-8">

</head>
<body>
	<!--               꼭 들어가야 하는 코드               시작                                                        -->
	<jsp:include page="header.jsp"></jsp:include>
	<header>
		<h2>탬플릿1</h2>
	</header>
	<!--               꼭 들어가야 하는 코드               끝                                                        -->

	<!-- -----------------------------------------------------------------  여기까지 살리고 밑에서 부터  내용 만드시면됩니다 -->
	<!-- 내용 쓰는곳 -->
	<section>
		<jsp:include page="search_body.jsp"></jsp:include>
		<jsp:include page="search_list.jsp"></jsp:include>
	</section>


	<!-- -----------------------------------------------------------------  ------------------------ -->
	

</body>
</html>
