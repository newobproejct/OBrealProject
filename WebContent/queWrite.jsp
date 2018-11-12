<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>queWrite.jsp</title>
<script>
	function sendData(frm) {
		frm.action = "controller?type=queWrite&board_type=3";
		frm.submit();
	}
	function que_go() {
		location.href = "controller?type=que&board_type=3";
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<header>
		<h2>문의사항</h2>
	</header>
	<section>
		<nav>
			<ul>
				<li><a href="controller?type=notice&board_type=1">공지사항</a></li>
				<li><a href="controller?type=moreQue">자주 묻는 질문</a></li>
				<li id="li3">문의사항</li>
				<li><a href="controller?type=premium&board_type=4">프리미엄 후기</a></li>
				<li><a href="controller?type=agree">약관 및 동의사항</a></li>
			</ul>
		</nav>

		<article>
			<div id="write">
				<form method="POST">
					<table border="1">
						<caption>문의사항 작성하기</caption>
						<tbody>
							<tr>
								<th>제목</th>
								<td><input type="text" name="title" size="30"></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><b>${uservo.nickname}</b></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${uservo.tel}</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${uservo.email}</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea
										placeholder="문의 사항 작성 시 문의하실 사항을 선택하여 기입해주세요. 1.회원가입문의 / 2.로그인관련문의 / 3.예약관련문의 / 4.기타문의"
										name="content" rows="10" cols="50"></textarea></td>
							</tr>
							<tr>
								<td colspan="2">
								<input type="button" value="저 장" onclick="sendData(this.form)"> 
								<input type="reset" value="다시작성">
								<input type="button" value="돌아가기" onclick="que_go(this.form)">
								
								<input type="hidden" name="write_chk" id="chk"> 
							</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</article>
	</section>
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>