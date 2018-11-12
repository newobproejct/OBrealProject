<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>테스트 2페이지입니다</title>
<meta charset="utf-8">
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<header>
		<h2>탬플릿2</h2>
	</header>
	<!-- -----------------------------------------------------------------  여기까지 살리고 밑에서 부터  내용 만드시면됩니다 -->
	<!-- 내용 쓰는곳 -->
	<section>
		<nav>
			<ul>
				<li><a href="#">영역1</a></li>
				<li><a href="#">영역2</a></li>
				<li><a href="#">영역3</a></li>
			</ul>
		</nav>

		<article>
	
			<h1>가나다라마바사</h1>
			<p>P 태그로 나눈 구역1.</p>
			<p>p 태그로 나눈 구역2</p>
		</article>
	</section>



	<!-- -----------------------------------------------------------------  ------------------------ -->
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>

</body>
</html>
