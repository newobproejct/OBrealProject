<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약하기</title>
<script>
	//이번달 변수
	var today = new Date();
	alert(today);
	today = new Date(today.getFullYear(), today.getMonth(), today.getDate());
	var year = today.getFullYear();
	var mon = today.getMonth();
	var day = today.getDate();
	var startDate = today;
	var startDate2 = today;
	var firstday = new Date(today.getFullYear(), today.getMonth(), 1);
	var lastday = new Date(today.getFullYear(), today.getMonth()+1, 0);
	alert("today : " + today + "\n" + 
			"year : " + year + "\n" + 
			"mon : " + mon + "\n" + 
			"day : " + day + "\n" + 
			"startDate : " + startDate + "\n" + 
			"firstday : " + firstday + "\n" + 
			"lastday : " + lastday);
</script>

<script>
	function reserveOk(frm){
		alert("reserveOk실행");
		frm.action="controller?type=reservationOk";
		frm.submit();
	}
	function toDate(dateStr) {
		var parts = dateStr.split("-")
	  	return new Date(parts[2], parts[1]-1, parts[0])
	}
	function setVal(val){
		alert(val);
		var sd = val;
 		var temp ='<span>체크아웃</span>';
 		var nsd = new Date();
 		var ned = new Date();
	   	temp += '<select id="e_date">';
	   	
		//temp += '<c:forEach var="ed" items="${enableDates}">';
		//temp += '<c:if test="${ed>=sd}">';
		//temp += '<option>${ed }1</option>';
		//temp += '</c:if>';
		//temp += '</c:forEach>';
		<c:forEach var = "ed" items = "${enableDates}">
				var date = "${ed}";
				nsd = toDate(sd);
				ned = toDate(date);
				console.log("nsd : " + nsd + "ned : " + ned);
				if(nsd<=ned){
					temp += '<option>${ed}</option>';
				}		
		</c:forEach>
		
		temp += '</select>'; 
		alert(temp);
		console.log(temp);
		document.getElementById("checkout").innerHTML=temp;
	}
</script>
</head>
<body>
<form method="post">
<table>
	<tr>
		<td colspan="2">
			<img id="imgsize" src="imgs/${roomTable.filename}"
				alt="${roomTable.room_name }">
		</td>
	</tr>
	<tr>
		<th>숙소명</th><td>${roomTable.room_name }</td>
	</tr>
	<tr>
		<th>주소</th><td>${roomTable.room_address1 } &nbsp; ${roomTable.room_address2 } </td>		
	</tr>
	<tr>							
		<th>호실</th><td>${roomTable.room_num }</td>
	</tr>
	<tr>
		<th>타입</th><td>${roomTable.room_type }</td>
	</tr>
	<tr>
		<th>숙박가격(1일)</th><td>${roomTable.cost }(단위:천원)</td>
	</tr>
	<tr>
		<th>최대인원</th><td>${roomTable.max_pax }명</td>
	</tr>
	<tr>
		<th>숙소설명</th><td>${roomTable.room_content }</td>
	</tr>
	<tr>
		<th>테마</th><td>${roomTable.room_theme }</td>
	</tr>
	<tr>
		<th>예약가능일</th>
		<td>
			<font>체크인</font>
			<div id="checkin">
				<select id="s_date" onchange="setVal(this.value)"> 
					<c:forEach var="ed" items="${enableDates}">
						<option>${ed }</option>
					</c:forEach>
				</select>
			</div>
			
			
			<!--
			체크아웃 날짜는 체크인 날짜 이후여야 하고
			체크아웃 날짜는 예약이 가능해야 하지만 아직 구현되지 않음
			-->
			<div id="checkout">
			</div>
		</td>
	</tr>
	<tr>
		<th>숙박인원</th>
		<td>
			<input type="number" name="pax" min="1" max="${roomTable.max_pax }" value="1"><br>
			(최대인원 : ${roomTable.max_pax }명)
		</td>
	</tr>
	<tr>
		<th>숙박료</th>
		<td id="cost">
		</td>
	</tr>
	
	<tr>
		<td colspan="2"><input type="button" onclick="reserveOk(this.form)" value="예약하기"></td>
	</tr>
</table>
</form>
</body>
</html>