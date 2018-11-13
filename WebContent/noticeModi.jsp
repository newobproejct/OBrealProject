<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
#bbs_modi table {
    width:580px;
    margin-left:10px;
    border:1px solid black;
    border-collapse:collapse;
    font-size:14px;
}
#bbs_modi table caption {
    font-size:20px;
    font-weight:bold;
    margin-bottom:10px;
}
#bbs_modi table th {
    text-align:center;
    border:1px solid black;
    padding:4px 10px;
    width: 30%;
    background-color: lightsteelblue;
}
#bbs_modi table td {
    text-align:left;
    border:1px solid black;
    padding:4px 10px;
}
#setting {
	margin-left: 10px;
}
</style>
<script>
	function save_go() {
	    frm.action = "controller?type=noticeModi&board_type=1";
	    frm.submit();
	 }
	function list_go() {
	    frm.action = "controller?type=notice&board_type=1";
	    frm.submit();
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
			<div id="bbs_modi">
				<form method="post" name="frm">
					<table>
						<caption>공지사항 수정하기</caption>
						<tbody>
							<tr>
								<th>제목</th>
								<td><input type="text" name="title" value="${BPVO.title }"></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>관리자</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><input type="text" name="content" value="${BPVO.content}"
									style="width:300px; height:50px;"></td>
							</tr>
						</tbody>
					</table>
						<div id="setting">
						<br>
									<input type="button" value="수  정" onclick="save_go()">
									<input type="reset" value="초 기 화">
									<input type="button" value="목  록" onclick="list_go()">
									
									<input type="hidden" name="update_id" value="${BPVO.id}">
									<input type="hidden" name="update_chk" value="chk">
						</div>		
					</form>
				</div>
			</article>
		</section>
	
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>