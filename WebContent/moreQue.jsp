<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>QUESTION.JSP</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
	.QueList {
		height: 150px;
		width: 150px;
	}
	#btn {
		height: 150px;
		width: 150px;
	}
</style>
<script>
function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace("w3-black", "w3-red");
    } else { 
        x.className = x.className.replace(" w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace("w3-red", "w3-black");
    }
}
</script>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
		<header>
			<h2>탬플릿2</h2>
		</header>
		<section>
			<nav>
				<ul>
					<li><a href="controller?type=notice&board_type=1">공지사항</a></li>
					<li id="li2">자주 묻는 질문</li>
					<li><a href="controller?type=que&board_type=3">문의사항</a></li>
					<li><a href="controller?type=premium&board_type=4">프리미엄 후기</a></li>
					<li><a href="controller?type=agree">약관 및 동의사항</a></li>
				</ul>
			</nav>
		
		
		<article>
			<div class="w3-container">
				<h2>Active Accordions</h2>
				<p>In this example we add the w3-red class to an active accordion (when the button is clicked on and the content is opened).</p>
				
				<button id="onclick="myFunction('Demo1')" class="w3-button w3-block w3-black w3-left-align">Open Section 1</button>
				<div id="Demo1" class="w3-hide w3-container">
				    <p>Some text..</p>
				</div>
				
				<button onclick="myFunction('Demo2')" class="w3-button w3-block w3-black w3-left-align">Open Section 2</button>
				<div id="Demo2" class="w3-hide w3-container">
				    <p>Some other text..</p>
				</div>
				
				</div>
		</article>
	</section>
	<!-- -----------------------------------------------------------------  ------------------------ -->
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>
