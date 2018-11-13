<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약하기</title>
</head>
<body>
<table>
	<tr>
		<td>
			<img id="imgsize" src="imgs/${roomTableList.filename}"
				alt="${roomTableList.room_name }">
		</td>
		<td>${roomTableList.room_name }</td>
		<td>${roomTableList.room_address1 } &nbsp; ${roomTableList.room_address2 } </td>									
		<td>${roomTableList.room_num }</td>
		<td>${roomTableList.room_type }</td>
		<td>${roomTableList.cost }원</td>
		<td>${roomTableList.max_pax }명</td>
		<td>${roomTableList.room_content }</td>
		<td>${roomTableList.room_theme }</td>
	</tr>
	<tr>
		<td colspan="3">예약가능일</td>
		<td colspan="3">
			<c:select var="ableDate" items="">
				<c:option></c:option>
			</c:select>
		</td>
	</tr>
</table>

</body>
</html>