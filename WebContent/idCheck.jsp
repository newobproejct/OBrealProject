<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	// 회원가입의  아이디 입력란의 값을 가져옴
	function pValue() {
		document.getElementById("userID").value = opener.document.formm.id.value;
	}
	function sendCheckValue() {
		opener.formm.reid.value = "${account}";
		opener.formm.account.value = "${account}";
		self.close();
	}
	function idCheck() {
		location.href = "controller?type=idCheck";
	}
</script>
</head>
<body onload="pValue()">
	<div id="wrap">
		<h1>ID 중복확인</h1>
			<div id="chk">
				<form method="POST" name="formm" style="margin-right:0">
					ID <input type="text" name="idinput" id="userID">
					   <input type="submit" value="중복확인" class="submit" onclick="idCheck()"><br>
				</form>
			</div>
			
			<div style="margin-top: 20px">
			<c:if test="${message == 1}">
				<script>
					opener.document.formm.account.value="";
				</script>
				${account}는 이미 사용중인 아이디입니다.
			</c:if>
			<c:if test="${message == -1}">
				${account}는 사용 가능한 아이디입니다.
			</c:if>
			</div>
			
			<div id="msg">
			<br>
			<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">&nbsp;&nbsp;
			<input id="cancelBtn" type="button" value="취소" onclick="window.close()">
			</div>
	</div>
</body>
</html>