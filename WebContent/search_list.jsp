<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#hotel table {
	width: 580px;
	margin-left: 10px;
	border: 1px solid black;
	border-collapse: collapse;
	font-size: 14px;
}

#hotel table th, #hotel table td {
	text-align: center;
	border: 1px solid black;
	padding: 4px 10px;
}

.title {
	background-color: lightsteelblue;
}

/******* 페이지 표시 부분 스타일(시작) *****/
.paging {
	list-style: none;
}

.paging li {
	float: left;
	margin-right: 8px;
}

.paging li a {
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	font-weight: bold;
	color: black;
}

.paging li a:hover {
	background-color: #00B3DC;
	color: white;
}

.paging .disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.paging .now {
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background-color: #ff4aa5;
	color: white;
	font-weight: bold;
}

/******* 페이지 표시 부분 스타일(종료) ***/
#imgsize {
	width: 200px;
	height: 250px;
}

.title {
	background-color: lightsteelblue;
}
</style>
<script type="text/javascript">
	function res_go(frm) {
		frm.action = "controller?type=reservation";
		frm.submit();
	}
</script>
</head>

<body>
	<c:if test="${not empty getRoomimp }">
		<div id="hotel">
			<table style="width: 100%">
				<thead>
					<tr class="title">
						<th>사진</th>
						<th style="width: 17%">호텔이름</th>
						<th style="width: 10%">위치</th>
						<th style="width: 10%;">방번호</th>
						<th style="width: 10%;">타입</th>
						<th style="width: 18%;">하루 숙박요금</th>
						<th style="width: 10%;">수용인원</th>
						<th style="width: 30%;">간단 설명</th>
						<th style="width: 10%;">테마</th>
						<th style=""></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty getRoomimp  }">
							<tr>
								<td colspan="10"><h2>검색 조건이 없습니다</h2></td>
							</tr>
						</c:when>
						<c:otherwise>
							<form method="post">
								<!--데이타 있는 경우 tr 태그 작성 -->
								<c:forEach var="roomlist" items="${getRoomimp }">
									<tr>
										<td><a href="#" title="이미지사진"> <img id="imgsize"
												src="imgs/${roomlist.filename}" onclick="res_go(this.form)"
												alt="${roomlist.room_name }"></a></td>
										<td>${roomlist.room_name }</td>
										<td>${roomlist.room_address1 }&nbsp;
											${roomlist.room_address2 }</td>
										<td>${roomlist.room_num }</td>
										<td>${roomlist.room_type }</td>
										<td>${roomlist.cost }원</td>
										<td>${roomlist.max_pax }명</td>
										<td>${roomlist.room_content }</td>
										<td>${roomlist.room_theme }</td>

										<td><input type="button" value="예약하기"
											onclick="res_go(this.form)"></td>

									</tr>
									<input type="hidden" name="room_id" value="${roomlist.room_id}"> 
									<input type="hidden" name="room_type_id" value="${roomlist.room_type_id}"> 
									<input type="hidden" name="room_name" value="${roomlist.room_name}"> 
									<input type="hidden" name="room_num" value="${roomlist.room_num}"> 
									<input type="hidden" name="room_content" value="${roomlist.room_content}"> 
									<input type="hidden" name="room_address1" value="${roomlist.room_address1}"> 
									<input type="hidden" name="room_address2" value="${roomlist.room_address2}"> 
									<input type="hidden" name="room_theme" value="${roomlist.room_theme }"> 
									
								</c:forEach>
							</form>
						</c:otherwise>
					</c:choose>

				</tbody>
				<tfoot>
					<tr>
						<td colspan="10">
							<ol class="paging">
								<%--[이전으로]에 대한 사용여부 처리 --%>
								<c:choose>
									<%-- 사용불가(disable) : 첫번째 블록인 경우 --%>
									<c:when test="${pvo.beginPage == 1 }">
										<li class="disable">이전으로</li>
									</c:when>
									<%--사용가능(enable) : 두번째 이상(첫번째 아닌경우) --%>
									<c:otherwise>
										<li><a
											href="controller?type=search_list&cPage=${pvo.beginPage - 1 }">이전으로</a>
										</li>
									</c:otherwise>
								</c:choose>

								<%-- 블록내에 표시할 페이지 반복처리(시작페이지~끝페이지)--%>
								<c:forEach var="k" begin="${pvo.beginPage }"
									end="${pvo.endPage }">
									<c:choose>
										<c:when test="${k == pvo.nowPage }">
											<li class="now">${k }</li>
										</c:when>
										<c:otherwise>
											<li><a href="controller?type=search_list&cPage=${k }">${k }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<%--[다음으로]에 대한 사용여부 처리 --%>
								<c:choose>
									<%--사용불가(disable) : endPage가 전체페이지수 보다 크거나 같으면 --%>
									<c:when test="${pvo.endPage >= pvo.totalPage }">
										<li class="disable">다음으로</li>
									</c:when>
									<%--사용가능(enable) --%>
									<c:otherwise>
										<li><a
											href="controller?type=search_list&cPage=${pvo.endPage + 1 }">다음으로</a>
										</li>
									</c:otherwise>
								</c:choose>
							</ol>
						</td>



					</tr>
				</tfoot>
			</table>
		</div>
	</c:if>

</body>
</html>