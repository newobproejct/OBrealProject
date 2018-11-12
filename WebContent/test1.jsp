<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>test1 페이지입니다</title>
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
	<p>공백 원하는 내용 작성</p>



	<!-- -----------------------------------------------------------------  ------------------------ -->
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>

</body>
</html>
