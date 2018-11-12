<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeWrite.jsp</title>
<script>
	function sendData() {
		var firstForm = document.forms[0];
		for (var i = 0; i < firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == "") {
				if (i == 3)
					continue;
				alert(firstForm.elements[i].title + " 입력하세요.");
				firstForm.element[i].focus();
				return;
			}
		}
		firstForm.submit();
	}

	function notice_go() {
		location.href = "controller?type=notice&board_type=1";
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<header>
		<h2>공지사항</h2>
	</header>
	<section>
		<nav>
			<ul>
				<li id="li1">공지사항</li>
				<li><a href="controller?type=moreQue">자주 묻는 질문</a></li>
				<li><a href="controller?type=que&board_type=3">문의사항</a></li>
				<li><a href="controller?type=premium&board_type=4">프리미엄 후기</a></li>
				<li><a href="controller?type=agree">약관 및 동의사항</a></li>
			</ul>
		</nav>

		<article>
			<div id="write">
				<form method="POST">
					<table>
						<caption>공지사항 작성하기</caption>
						<tbody>
							<tr>
								<th>제목</th>
								<td><input type="text" name="title" size="45" title="제목">
								</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><b>관리자(admin)</b></td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
									<textarea name="content" rows="8" cols="50" title="내용"></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="2">
								<input type="button" value="저 장" onclick="sendData()"> 
								<input type="reset" value="다 시 작 성">
								<input type="button" value="돌 아 가 기" onclick="notice_go()">
								<input type="hidden" name="write_chk" value="chk"> 
								<input type="hidden" name="board_type" value="1"> 
								<input type="hidden" name="sysdate" value="sysdate"> 
								<input type="hidden" name="read_count" value="0">
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