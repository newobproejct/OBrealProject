<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 시스템</title>
<script type="text/javascript">
	function admin_system_add_go() {
		document.frm.action = "controller?type=admin_system_add_go";
		document.frm.submit();
	}
	function admin_system_addfile_go() {
		document.frm.action = "controller?type=admin_system_addfile_go";
		document.frm.submit();
	}
	function admin_system_modify_go() {
		document.frm.action = "controller?type=admin_system_modify_go";
		document.frm.submit();
	}
	function admin_system_delete_go() {
		document.frm.action = "controller?type=admin_system_delete_go";
		document.frm.submit();
	}
	function page_back() {
		document.frm.action = "controller?type=main";
		document.frm.submit();
	}
</script>
</head>
<body>
	<form method="post" name="frm">
		<input type="button" value="글쓰기_추가" onclick="admin_system_add_go()">
		<input type="button" value="파일_추가" onclick="admin_system_addfile_go()">
		
		<input type="button" value="글쓰기_수정" onclick="admin_system_modify_go()">
		<input type="button" value="글쓰기 삭제" onclick="admin_system_delete_go()">
		<input type="button" value="목록" onclick="page_back()">
	</form>

</body>
</html>