<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
	// 다시 중복체크 가능해짐
	function inputIdChk() {
		document.formm.reid.value = "idUncheck";
	}
	
	function go_save() {
		if (document.formm.id.value == "") {
			alert("아이디를 입력해 주세요.");
			document.formm.id.focus();
		} 
// 		else if (document.formm.id.value != document.formm.reid.value) {
// 			alert("중복확인을 클릭해 주세요.");
// 			document.formm.id.focus();
// 		} 
		else if (document.formm.pwd.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.formm.pwd.focus();
		} else if (document.formm.name.value == "") {
			alert("이름을 입력해 주세요.");
			document.formm.name.focus();
		} else if(isNaN(document.formm.tel.value)){
            alert("전화번호는 - 제외한 숫자만 입력해 주세요.");
            document.formm.tel.focus();
            return false;
  		} else if (document.formm.zipcode.value == "") {
			alert("주소를 입력해 주세요.");	
			document.formm.zipcode.focus();
		} else if (document.formm.address.value == "") {
			alert("주소를 입력해 주세요.");	
			document.formm.address.focus();
		} else if (document.formm.detail.value == "") {
			alert("주소를 입력해 주세요.");	
			document.formm.detail.focus();
		} else if (document.formm.email.value == "") {
			alert("이메일을 입력해 주세요.");	
			document.formm.email.focus();
		} else if (document.formm.birthday.value == "") {
			alert("생년월일을 입력해 주세요.");	
			document.formm.birthday.focus();
		} else {
			document.formm.action = "controller?type=joincheck";
			document.formm.submit();
		}
	}
	
	function idCheck() {
		var inputId = document.formm.id.value;
		if (inputId == "" || inputId.length == 0){
			alert("중복 체크할 아이디를 먼저 입력하세요.")
			document.formm.id.focus();
			return;
		}
		var account = document.getElementById('account').value;
		window.open("controller?type=idCheck&id="+account, "chkForm", "width=350, height=300, resizable=no, scrollbars=no");
	}
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<header>
	<h2>Join Us</h2>
	</header>
	
	<article>
		<h2>Join Us</h2>
			<form id="join" method="POST" name="formm">
				<fieldset>
					<legend>회원가입</legend>
					
					<label>아이디</label>
					<input type="text" id="account" name="id" placeholder="회원아이디" size="22" onkeydown="inputIdChk()">
					<input type="hidden" name="reid" value="idUncheck">
					<input type="button" value="중복확인" class="dup" onclick="idCheck()"><br><br>
					
					<label>비밀번호</label>
					<input type="password" name="pwd" placeholder="비밀번호"><br><br>
					
					<label>이름</label>
					<input type="text" name="name" placeholder="이름"><br><br>
					
					<label>휴대폰 번호</label>
					<input type="text" name="tel" placeholder="휴대폰번호"><br><br>
					
					<label>주소</label>
					<input type="text" name="zipcode" id="zipcode" placeholder="우편번호" size="15"><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="address" id="roadaddress" placeholder="예) 서울특별시"><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="detail" placeholder="예) 마포구 백범로..."><br><br>		
					
					<label>E-Mail</label>
					<input type="text" name="email" placeholder="이메일"><br><br>
					
					<label>생년월일</label>
					<input type="text" name="birthday" placeholder="예) 90/01/01"><br><br>
													
					<label>광고 수신 동의</label>
					<input type="radio" name="e_confirm" value="0" checked>동의함&nbsp;&nbsp;&nbsp;
					<input type="radio" name="e_confirm" value="1">동의안함 <br>
				</fieldset>
				<br>
				<br>
				<div>
					<input type="button" value="회원가입" class="submit" onclick="go_save()">
					<input type="reset" value="취소" class="cancels">
				</div>
			</form>
		 </article>
	<footer>
		<jsp:include page="footer.jsp"/>
	</footer>
</body>
</html>