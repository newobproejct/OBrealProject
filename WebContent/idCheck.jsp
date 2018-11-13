<%@page import="com.ob.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
// 	function idCheck(frm) {
// 		document.frm.action = "controller?type=idCheck";
// 		document.frm.submit();

// 		if (${idChk == '1'}) {
// 			alert("사용 가능한 아이디입니다.");			
// 		} else {
// 			alert("이미 사용중인 아이디입니다.");
// 			document.frm.idinput.value = "";
// 			document.frm.idinput.focus();
// 			return false;
// 		}
// 	}
</script>
</head>
<body>
	<div id="wrap">
		<h1>ID 중복확인</h1>
			<div id="chk">
				<form method="POST" name="frm" style="margin-right:0">
					<c:if test="${empty uVO}">
						<h3>사용이 가능한 아이디입니다.</h3>
					</c:if>
					<c:if test="${not empty uVO}">
						<h3>이미 사용중인 아이디입니다.</h3>
					</c:if>
				</form>
			</div>
			
			<div id="msg">
			<br>
			<input id="useBtn" type="button" value="닫기" onclick="self.close()">
			</div>
	</div>
</body>
</html>