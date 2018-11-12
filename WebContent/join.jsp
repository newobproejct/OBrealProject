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
		window.name="parentform";
		window.open("idCheck.jsp", "chkForm", "width=500, height=300, resizable=no, scrollbars=no");
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
					<input type="text" name="id" placeholder="회원아이디" size="22" onkeydown="inputIdChk()">
					<input type="hidden" name="reid" value="idUncheck">
					<input type="button" value="중복확인" class="dup" onclick="idCheck()"><br><br>
					
					<label>비밀번호</label>
					<input type="password" name="pwd" placeholder="비밀번호"><br><br>
					
					<label>이름</label>
					<input type="text" name="name" placeholder="이름"><br><br>
					
					<label>휴대폰 번호</label>
					<input type="text" name="tel" placeholder="휴대폰번호"><br><br>
					
					<label>주소</label>
					<input type="text" name="zipcode" id="zipcode" placeholder="우편번호" size="15">
					<input type="button" value="주소찾기" class="dup" onclick="post_zip()"><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="address" id="roadaddress" placeholder="도로명주소"><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="detail" placeholder="상세주소"><br><br>		
					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<script>
					 function post_zip() {
						  new daum.Postcode({
								oncomplete: function(data) {
									
									 var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
									 var extraRoadAddr = ''; // 도로명 조합형 주소 변수
					

									 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
										  extraRoadAddr += data.bname;
									 }

									 if(data.buildingName !== '' && data.apartment === 'Y'){
										 extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
									 }

									 if(extraRoadAddr !== ''){
										  extraRoadAddr = ' (' + extraRoadAddr + ')';
									 }

									 if(fullRoadAddr !== ''){
										  fullRoadAddr += extraRoadAddr;
									 }
					

									 document.getElementById('zipcode').value = data.zonecode;
									 document.getElementById('roadaddress').value = fullRoadAddr;

									 
									 if(data.autoRoadAddress) {
									
										  var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
										  document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
					
									 } else if(data.autoJibunAddress) {
										  var expJibunAddr = data.autoJibunAddress;
										  document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
					
									 } else {
										  document.getElementById('guide').innerHTML = '';
									 }
								}
						  }).open();
					 }
					</script>
					
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