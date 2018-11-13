<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%				
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
    int mon = cal.get(Calendar.MONTH)+1;
    int day = cal.get(Calendar.DAY_OF_MONTH);
    System.out.println("day:" + day);
    int startDate = day;
    int firstday = cal.getActualMinimum(Calendar.DATE);
    int lastday = cal.getActualMaximum(Calendar.DATE);
    List<String> enableDateList = (List<String>)request.getAttribute("dates");
    System.out.println("enableDateList : " + enableDateList);
    String nowDate="";
%>		      


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약하기</title>
</head>
<body>
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
		<td>예약가능일</td>
		<td>
			<select var="ableDate" items="">  
<%
		        for(int i=startDate; i<=lastday; i++){
		        	nowDate = year + "-" + mon + "-" + i;
		        	if(!enableDateList.contains(nowDate)){
%>
						<option><%=nowDate %></option>
<%
		     	  	};
		        };
		        
%>
			</select>
		</td>
	</tr>
</table>

</body>
</html>