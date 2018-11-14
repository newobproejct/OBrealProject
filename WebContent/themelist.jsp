<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>test1 페이지입니다</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="utf-8">
<style>
.btn-group .button {
	background-color: #4CAF50; /* Green */
	border: 1px solid green;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
	float: left;
	width: 50%;
	height: 150px;
}

.btn-group .button:hover {
	background-color: #3e8e41;
}
</style>

<script>
	$(document).ready(function() {
		$("#show1").click(function() {
			$("#one").css("display", "block");
			$("#two").css("display", "none");

			$("#one").css("background-color", "red");
			$("#show1").css("background-color", "red");
		});
		$("#show2").click(function() {
			$("#two").css("display", "block");
			$("#one").css("display", "none");
			$("#two").css("background-color", "blue");
			$("#show2").css("background-color", "blue");

		});
	});
</script>
<script>
	function search_go(frm) {
		frm.action = "controller?type=search_list";
		frm.submit();
	}
	function search_theme(frm) {
		frm.action = "controller?type=search_theme";
		frm.submit();
	}
</script>
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
		frm.action = "controller?type=addadd";
		frm.submit();
	}
</script>
</head>

<body>
	<!--               꼭 들어가야 하는 코드               시작                                                        -->
	<jsp:include page="header.jsp"></jsp:include>
	<header>
		<h2>탬플릿1</h2>
	</header>
	<!--               꼭 들어가야 하는 코드               끝                                                        -->

	<!-- -----------------------------------------------------------------  여기까지 살리고 밑에서 부터  내용 만드시면됩니다 -->
	<!-- 내용 쓰는곳 -->
	<section>



		<div class="btn-group">
			<button class="button" id="show1">지역별</button>
			<button class="button" id="show2">테마별</button>
		</div>
		<form method="post">
			<div id="one" style="display: none;">
				<c:forEach var="si" items="${si_gu}">
					<input type="radio" id="chk_si" name="chk_si" value="${si.key }">${si.key }				
			</c:forEach>
				<hr>

				<div id="go" style="display: block;">
					<c:forEach var="gu" items="${gu}">
						<input type="radio" id="chk_gu" name="chk_gu" value="${gu } ">${gu }</c:forEach>
				</div>
				<input type="button" value="조 회" onclick="search_go(this.form)">
			</div>
		</form>


		<form method="post">
			<div id="two" style="display: none;">
				<c:forEach var="theme" items="${theme}">
					<input type="radio" id="chk_theme" name="chk_theme"
						value="${theme }">${theme }				
			</c:forEach>
				<input type="button" value="조 회" onclick="search_theme(this.form)">
			</div>
		</form>




		<c:if test="${not empty getRoomthemeimp }">
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
							<c:when test="${empty getRoomthemeimp  }">
								<tr>
									<td colspan="10"><h2>검색 조건이 없습니다</h2></td>
								</tr>
							</c:when>
							<c:otherwise>
							<form method="post">
								<!--데이타 있는 경우 tr 태그 작성 -->
								<c:forEach var="roomlist" items="${getRoomthemeimp }">
									<tr>
										<td>
											<%-- <a href="controller?type=event_detail&b_id=${vo.id }"
							title="event이미지">  --%> <a href="#" title="이미지사진"></a><img
											id="imgsize" src="imgs/${roomlist.filename} "
											alt="${roomlist.room_name }">
										</td>
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
												href="controller?type=search_theme&cPage=${pvo.beginPage - 1 }">이전으로</a>
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
												<li><a href="controller?type=search_theme&cPage=${k }">${k }</a></li>
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
												href="controller?type=search_theme&cPage=${pvo.endPage + 1 }">다음으로</a>
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



	</section>


	<!-- -----------------------------------------------------------------  ------------------------ -->


</body>
</html>
