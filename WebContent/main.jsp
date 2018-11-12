<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Main 페이지입니다.</title>
<meta charset="utf-8">
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<header>
		<h2>나랑놀자</h2>
	</header>
	<!-- -----------------------------------------------------------------  여기까지 살리고 밑에서 부터  내용 만드시면됩니다 -->
	<!-- 내용 쓰는곳 -->
<section>
<jsp:include page="mainBody.jsp"></jsp:include>
</section>


	<!-- -----------------------------------------------------------------  ------------------------ -->
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>

</body>
</html>
