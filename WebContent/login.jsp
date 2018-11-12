<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LogIn</title>
<style>
form label {
	width: 140px;
	float: left;
	margin: 5px 0;
}
form input{
	margin: 5px;
}
form {
	margin-left: 200px;
}
legend {
	font-size: 3em;
}
fieldset {
	border: 1px solid white;
}

</style>
<script>
	function login_go(frm) {
		if (frm.id.value.length == 0) {
			alert("아이디를 입력해 주세요.");
			frm.id.focus();
			return false;
		}
		if (frm.pwd.value.length == 0) {
			alert("비밀번호를 입력해 주세요.");
			frm.pwd.focus();
			return false;
		} else {
			frm.action = "controller?type=loginCheck";
			frm.submit();
		}
	}
	function join_go(frm) {
		frm.action = "controller?type=contract"
		frm.submit();
	}
	function back_go(frm) {
		frm.action = "controller?type=main"
		frm.submit();
	}
</script>

<title>login.jsp</title>
<meta charset="utf-8">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<header>
	<h1>Login</h1>
	</header>
	<div id="sub_img">
		<img src="imgs/Login/sub_img.png">
	</div>
	<div class ="login">
		<form method="post" name="frm">
			<fieldset>
			<legend><b>Login</b></legend>
				<label>User ID</label>
				<input name="id" type="text"><br>
				<label>Password</label>
				<input name="pwd" type="password"><br>
			</fieldset>
			<div class="clear"></div>
				<input type="submit" value="로그인" class="submit" onclick="login_go(this.form)">&nbsp;&nbsp;
				<input type="button" value="회원가입" class="join" onclick="join_go(this.form)">&nbsp;&nbsp;
				<input type="button" value="돌아가기" class="back" onclick="back_go(this.form)">
		</form>        
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>