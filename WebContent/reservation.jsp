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
			<img id="imgsize" src="imgs/${roomlist.filename}"
				alt="${roomlist.room_name }">
		</td>
		<td>${roomlist.room_name }</td>
		<td>${roomlist.room_address1 } &nbsp; ${roomlist.room_address2 } </td>									
		<td>${roomlist.room_num }</td>
		<td>${roomlist.room_type }</td>
		<td>${roomlist.cost }원</td>
		<td>${roomlist.max_pax }명</td>
		<td>${roomlist.room_content }</td>
		<td>${roomlist.room_theme }</td>
	</tr>
	<tr>
		<td colspan="3">예약가능일</td>
		<td colspan="3">
			<c:select>
				<c:option></c:option>
			</c:select>
		</td>
	</tr>
</table>

</body>
</html>