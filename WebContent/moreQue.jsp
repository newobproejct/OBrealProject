<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<title>QUESTION.JSP</title>
<style>
.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}

.active, .accordion:hover {
    background-color: #ccc; 
}

.panel {
    padding: 0 18px;
    display: none;
    background-color: white;
    overflow: hidden;
}
</style>
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
		</section>
		
		<h2>Accordion</h2>

		<button class="accordion">Section 1</button>
		<div class="panel">
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
		</div>
		
		<button class="accordion">Section 2</button>
		<div class="panel">
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
		</div>
		
		<button class="accordion">Section 3</button>
		<div class="panel">
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
		</div>
		
		<script>
		var acc = document.getElementsByClassName("accordion");
		var i;
		
		for (i = 0; i < acc.length; i++) {
		    acc[i].addEventListener("click", function() {
		        this.classList.toggle("active");
		        var panel = this.nextElementSibling;
		        if (panel.style.display === "block") {
		            panel.style.display = "none";
		        } else {
		            panel.style.display = "block";
		        }
		    });
		}
		</script>
	https://www.w3schools.com/howto/tryit.asp?filename=tryhow_js_accordion
	<!-- -----------------------------------------------------------------  ------------------------ -->
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>
