<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<header>
		<h2>나랑놀자</h2>
	</header>
	<section>
		<nav>
			<ul>
				<li id="li1">공지사항</li>
				<li><a href="controller?type=moreQue">자주 묻는 질문</a></li>
				<li><a href="controller?type=que&board_type=3">문의사항</a></li>
				<li><a href="controller?type=premium&board_type=4">프리미엄 후기</a></li>
				<li><a href="controller?type=agree">약관 및 동의사항</a></li>
			</ul>
		</nav>
		
		<form method="POST" id="revTable">
			<div id="revList">
				<table>
				<tbody>
				
					<c:if test="${empty userReservationvo}">
						<tr>
							<td><h2>예약 내역이 없습니다.</h2></td>
						</tr>
						<tr>
							<td><a href="controller?type=search">지금 당장 예약하러가기</a></td>	
						</tr>
					</c:if>
					
					
					<c:if test="${not empty userReservationvo}">
					<thead>
						<tr>
							<th>이미지</th>
							<th>방이름</th>
							<th>방타입</th>
							<th>방번호</th>
							<th>시작날짜</th>
							<th>끝날짜</th>
							<th>입실예정인원</th>
							<th>합계</th>
							<th>예약취소</th>
						</tr>
					</thead>
					<c:forEach var="i" begin="0" end="1000" step="1">
					<tr>
						<c:forEach var="vo" items="${userReservationvo}" varStatus="status">				
							<c:if test="${status.index == i}">			
								<td>
									 <img id="img" src="imgs/${vo.filename}" alt="${vo.filename}" height="120" width="130">
								</td>
							</c:if>
						</c:forEach>
						<c:forEach var="vo" items="${userReservationvo}" varStatus="status">				
							<c:if test="${status.index == i}">			
								<td>
									${vo.room_name}
								</td>
							</c:if>
						</c:forEach>
						<c:forEach var="vo" items="${userReservationvo}" varStatus="status">				
							<c:if test="${status.index == i}">			
								<td>
									${vo.room_type}
								</td>
							</c:if>
						</c:forEach>
						<c:forEach var="vo" items="${userReservationvo}" varStatus="status">				
							<c:if test="${status.index == i}">			
								<td style="text-align: center;">
									${vo.room_num}
								</td>
							</c:if>
						</c:forEach>
						<c:forEach var="vo" items="${userReservationvo}" varStatus="status">				
							<c:if test="${status.index == i}">			
								<td>
									${vo.s_date}
								</td>
							</c:if>
						</c:forEach>
						<c:forEach var="vo" items="${userReservationvo}" varStatus="status">				
							<c:if test="${status.index == i}">			
								<td>
									${vo.e_date}
								</td>
							</c:if>
						</c:forEach>
						<c:forEach var="vo" items="${userReservationvo}" varStatus="status">				
							<c:if test="${status.index == i}">			
								<td>
									${vo.pax}
								</td>
							</c:if>
						</c:forEach>
						<c:forEach var="vo" items="${userReservationvo}" varStatus="status">				
							<c:if test="${status.index == i}">			
								<td>
									${vo.cost}
								</td>
							</c:if>
						</c:forEach>
						<c:forEach var="vo" items="${userReservationvo}" varStatus="status">
							<c:if test="${status.index == i}">
								<td>
									<input type="button" id="revDel" value="삭제" onclick="rev_del()">
								</td>
						</c:if>
						</c:forEach>
					</tr>
					</c:forEach>
					</c:if>
				</tbody>
			 	</table>
			</div>
		</form>
	</section>

	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
		
</body>
</html>