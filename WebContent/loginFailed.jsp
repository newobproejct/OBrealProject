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
			alert("��ġ�ϴ� ���̵� �������� �ʽ��ϴ�.<br>�ٽ� Ȯ���Ͽ� �ֽʽÿ�.");
		} else if(errorType.equals(wrongPwd)){
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.<br>���������� �ٽ� Ȯ���Ͽ� �ֽʽÿ�.");
		}	
		history.back(-2);
	})
</script>
</head>
<body>

</body>
</html>