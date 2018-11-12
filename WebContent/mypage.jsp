<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#frm {
		margin-left: 20px;
	}
</style>
<script>
	function myPage_go() {
		var inputPwd = document.frm.inputPwd.value;
		var dbPwd = "${uservo.password}";
		if (inputPwd != dbPwd) {
			alert("비밀번호가 일치하지 않습니다.");
			document.frm.inputPwd.value = "";
			document.frm.inputPwd.focus();
			return false;
		} else {
			location.href = "controller?type=myPageModi";
		}
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<header>
		<h2>회원 정보 수정</h2>
	</header>
	<h3>개인 정보 수정을 위한 비밀번호 입력</h3>
	<form method="POST" name="frm" id="frm">
	<input type="password" name="inputPwd">
	<input type="button" name="button" value="확인" onclick="myPage_go()">
	<br><br>
	</form>
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>