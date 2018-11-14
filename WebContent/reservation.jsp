<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%				
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	
	//이번달
	int year = cal.get(Calendar.YEAR);
    int mon = cal.get(Calendar.MONTH)+1;
    int day = cal.get(Calendar.DAY_OF_MONTH);
    System.out.println("day:" + day);
    int startDate = day;
    int firstday = 1;
    int lastday = cal.getActualMaximum(Calendar.DATE);
    
    //다음달
    cal.set(year, mon, day);
	int year2 = cal.get(Calendar.YEAR);
    int mon2 = cal.get(Calendar.MONTH)+1;
    int day2 = cal.get(Calendar.DATE);
    int startDate2 = startDate;
    int lastday2 = cal.getActualMaximum(Calendar.DATE);
    
    List<String> enableDateList = (List<String>)request.getAttribute("dates");
    System.out.println("enableDateList : " + enableDateList);
    String nowDate="";
%>		      


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약하기</title>
<script>
	function reserveOk(frm){
		alert("reserveOk실행");
		frm.action="controller?type=reserveOk";
		frm.submit();
	}
	function setVal(val){
		alert("val");
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
			<select id="s_date" onchange="setVal(this.value)"> 
<%
				//이번달
		        for(int i=startDate; i<=lastday; i++){
		        	nowDate = year + "-" + mon + "-" + i;
		        	if(!enableDateList.contains(nowDate)){
%>
						<option><%=nowDate %></option>
<%
		     	  	};
		        };
		        
		        //다음달
		        for(int i=firstday; i<=lastday2; i++){
		        	nowDate = year2 + "-" + mon2 + "-" + i;
		        	if(!enableDateList.contains(nowDate)){
%>
						<option><%=nowDate %></option>
<%
		     	  	};
		        };
%>
			</select><br>
			
			<font>체크아웃</font>
			<!--
			체크아웃 날짜는 체크인 날짜 이후여야 하고
			체크아웃 날짜는 예약이 가능해야 하지만 아직 구현되지 않음
			-->
			<select id="e_date">  
<%
				//이번달
		        for(int i=startDate2; i<=lastday; i++){
		        	nowDate = year + "-" + mon + "-" + i;
		        	if(!enableDateList.contains(nowDate)){
%>
						<option><%=nowDate %></option>
<%
		     	  	};
		        };
		        
		        //다음달
		        for(int i=firstday; i<=lastday2; i++){
		        	nowDate = year2 + "-" + mon2 + "-" + i;
		        	if(!enableDateList.contains(nowDate)){
%>
						<option><%=nowDate %></option>
<%
		     	  	};
		        };
%>
			</select><br>
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