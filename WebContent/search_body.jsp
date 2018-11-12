<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>JQ</title>
<!-- jQuery import 방식2 : CDN -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>


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
	var obj = new Array();

	<c:forEach var="si_gu" items="${addressList}">
	var si = "${si_gu.room_address1 }";
	var gu = "${si_gu.room_address2}";
	var array = [ si, gu ];
	obj.push(array);
	</c:forEach>
	//alert(obj);
	//console.log(obj);
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
	function showSecond(self) {
		console.log(self);
		var result = "<div>";
		for (var i = 0; i < obj.length; i++) {
			if (obj[i][0] == self.value) {
				//alert(obj[i][1]);
				console.log("check : " + obj[i][1]);
				result += "<input type = 'radio' name = 'chk_gu' value = '"+obj[i][1]+"'>"
						+ obj[i][1] + "</input>";
			}
		}
		result += "</div>";
		var temp = document.getElementById("secondRadio");
		//alert(temp);
		temp.innerHTML = result;

		console.log(result);

	}
</script>


</head>
<body>
	<div class="btn-group">
		<button class="button" id="show1">지역별</button>
		<button class="button" id="show2">테마별</button>
	</div>
	<form method="post">
		<div id="one" style="display: none;">
			<c:forEach var="si" items="${si}">
				<input type="radio" name="chk_si" value="${si }"
					onclick="showSecond(this)">${si }						
			</c:forEach>
			<hr>
			<div id="secondRadio"></div>

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
</body>
</html>