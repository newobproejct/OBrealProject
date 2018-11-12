<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>queView.jsp</title>
<style>
#bbs_view table {
    width:580px;
    margin-left:10px;
    border:1px solid black;
    border-collapse:collapse;
    font-size:14px;
}
#bbs_view table caption {
    font-size:20px;
    font-weight:bold;
    margin-bottom:10px;
}
#bbs_view table th {
    text-align:center;
    border:1px solid black;
    padding:4px 10px;
    width: 30%;
    background-color: lightsteelblue;
}
#bbs_view table td {
    text-align:left;
    border:1px solid black;
    padding:4px 10px;
}	
</style>

<script>
	function modify_go(frm) {
		frm.action= "controller?type=queModi&board_type=3&id=${BPVO.id}";                 
		frm.submit();		
	}
	function delete_go(frm) {
		var DeleteOk = confirm("정말 삭제하시겠습니까?");
		
		if(DeleteOk) {
			frm.action="controller?type=quedelete&board_type=3&id=${BPVO.id}";
			frm.submit();		
		} else {
			alert="삭제취소 되었습니다."
		}
	
	function list_go(frm) {
			frm.action="controller?type=que&board_type=3";
		}
	function sendData(frm) {
			frm.actipn= ""
	}
	
	
	}
</script>
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
			<div id="bbs_view">
				<form method="post">
					<table>
						<caption>문의사항 상세보기</caption>
						<tbody>
							<tr>
								<th>작성자</th>
								<td>${uservo.nickname}</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${uservo.tel}</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${uservo.email}</td>
							</tr>
							<tr>
								<th>내용</th>
								<td>${BPVO.content}</td>
							</tr>
							<tr>
								<td colspan="2">
		                        <input type="button" value="수  정" onclick="modify_go(this.form)"> 
		                        <input type="button" value="삭  제" onclick="delete_go(this.form)"> 
		                        <input type="button" value="목  록" onclick="list_go(this.form)">
                        	</td>
                        	</tr>
						</tbody>
					</table>
				</form>
				<hr>
				<%-- 댓글입력 폼 --%>
				<form method="post">
					<p>ID : <input type="text" name="writer"></p>
					<p>내용 : <textarea name="content" rows="4" cols="55"></textarea>
					<p>비밀번호 : <input type = "password" name="pwd"></p>
					<input type="submit" value="댓글저장" onclick="sendData(this.form)">
					
					<input type="hidden" name="delete_chk" value="chk">
                    <input type="hidden" name="delete_id" value="${bplyVO.id}">
				</form>
				
				<hr>
				
				<%-- 댓글창 출력 --%>
				<div class="comment">
					<form>
						<p>이름: ${bplyVO.writer }</p>
						<p>날짜: ${bplyVO.write_date }</p>
						<p>내용: ${bplyVO.content }</p>
						<input type="button" value="수  정" onclick="reply_modify_go(this.form)">
						<input type="button" value="삭  제" onclick="reply_delete_go(this.form)">
					</form>
				</div>
				<hr>
			</div>		
		</article>
	</section>
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>










