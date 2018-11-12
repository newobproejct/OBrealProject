<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="container">
	<form action="controller?type=premiumWrite&board_type=4"
		method="post" enctype="multipart/form-data">
		<table>
			<caption>프리미엄 후기 작성란</caption>
			<tbody>
				<tr>
					<th>숙박</th>
					<td>
					<select name="reservation">
						<c:forEach var="usedRes" items="${getUsedResDetail }">
							<option value="${usedRes.id }" size="50">
								${usedRes.room_name} ${userRes.room_type}
								(${usedRes.s_date }~${usedRes.e_date })
							</option>
						</c:forEach>
					</select>
					<td>
				</tr>
				<tr>
					<th>타이틀</th>
					<td>
						<input type="text" name="title" size="50" title="타이틀">
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						${uservo.nickname }(${uservo.account })
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="20" cols="40"></textarea>
					</td>
				</tr>
			</tbody>
		</table>		
	
	</form>
</div>

</body>
</html>