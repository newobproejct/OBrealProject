<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js">
<script>
	$(function(){
		var errorType = request.getParameter("errorType");
		if(errorType.equals(nullId)){
			alert("일치하는 아이디가 존재하지 않습니다.<br>다시 확인하여 주십시오.");
		} else if(errorType.equals(wrongPwd)){
			alert("비밀번호가 일치하지 않습니다.<br>정신차리고 다시 확인하여 주십시오.");
		}	
		history.back(-2);
	})
</script>
</head>
<body>

</body>
</html>