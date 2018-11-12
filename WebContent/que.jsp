<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>que.jsp</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="utf-8">
<style>
nav a {
	text-decoration: none;
}

#li3 {
	font-size: 2em;
	font-weight: bold;
}

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
</style>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<header>
		<h2>문의사항</h2>
	</header>
	<section>
		<nav>
			<ul>
				<li><a href="controller?type=notice&board_type=1">공지사항</a></li>
				<li><a href="controller?type=moreQue">자주 묻는 질문</a></li>
				<li id="li3">문의사항</li>
				<li><a href="controller?type=premium&board_type=4">프리미엄 후기</a></li>
				<li><a href="controller?type=agree">약관 및 동의사항</a></li>
			</ul>
		</nav>

		<article>
			<div id="que_bbs">

				<table border="1">
					<caption>문 의 사 항</caption>
					<thead>
						<tr class="title">
							<th class="no">번호</th>
							<th class="title">제목</th>
							<th class="writer">작성자</th>
							<th class="write_date">작성일</th>
							<th class="read_count">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td colspan="5">
										<h2>현재 등록된 게시글이 없습니다.</h2>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="vo" items="${list}">
									<tr>
										<td>${vo.id}</td>
										<td><a href="controller?type=queView&board_type=3&id=${vo.id}&quePage=${quePvo.nowPage}">${vo.title}</a></td>
										<td>${vo.nickname}</td> 
										<td>${vo.write_date.substring(0, 10)}</td>
										<td>${vo.read_count}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4">
								<ol class="paging">
									<%-- [이전으로]에 대한 사용 여부를 처리 --%>
									<c:choose>
										<%-- 사용불가(disable): 첫번째 블록인 경우에만 --%>
										<c:when test="${quePvo.beginPage < quePvo.pagePerBlock }">
											<%-- <c:when test="${quePvo.beginPage != 1}"> 같은 의미--%>
											<li class="disable">이전으로</li>
										</c:when>
										<%-- 사용가능(enable): 두번재 블록 이상(첫번째만 아닌 경우) --%>
										<c:otherwise>
											<li><a
												href="controller?type=que&board_type=3&quePage=${quePvo.beginPage - 1 }">이전으로</a>
											</li>
										</c:otherwise>
									</c:choose>

									<%-- 블록내에 표시할 페이지 반복처리(시작 페이지 ~ 끝 페이지) --%>
									<c:forEach var="k" begin="${quePvo.beginPage}"
										end="${quePvo.endPage}">
										<c:choose>
											<c:when test="${k == quePvo.nowPage}">
												<li class="now">${k}
												</li>
											</c:when>
											<c:otherwise>
												<li><a
													href="controller?type=que&board_type=3&quePage=${k}">${k}</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>

									<%-- [다음으로]에 대한 사용여부 처리 --%>
									<c:choose>
										<%-- 사용불가(disable): 끝 페이지(endPage) 수가 전체 페이지(totalPage) 수 보다  크거나 같은 경우 --%>
										<c:when test="${quePvo.endPage >= quePvo.totalPage }">
											<li class="disable">다음으로</li>
										</c:when>
										<%-- 사용가능(enable) --%>
										<c:otherwise>
											<li><a
												href="controller?type=que&board_type=3&quePage=${quePvo.endPage + 1 }">다음으로</a>
											</li>
										</c:otherwise>
									</c:choose>
								</ol>
							</td>

							<td>
							<input type="button" value="작성하기" onclick="javascript:location.href='controller?type=queWrite&board_type=3&user_id=${uservo.id}'"></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</article>
	</section>

	<!-- -----------------------------------------------------------------  ------------------------ -->
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>

</body>
</html>
