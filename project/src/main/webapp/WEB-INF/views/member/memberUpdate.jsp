<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(function() {
	$("#btnComplete").click(function() {
		document.form.action = "/project/member/modify";
		document.form.submit();
	});
	$("#btnList").click(function() {
		document.form.action = "/project/member/list";
		document.form.submit();
	});
});
</script>
</head>
<body>
<form name="form" method="POST">
		ID : <input type="text" name="memID" value="${memberDTO.memID}" readonly><br>
		PW : <input type="password" name="memPW" value="${memberDTO.memID}" readonly><br>
		E-MAIL : <input type="email" name="memEMAIL" value="${memberDTO.memEMAIL}"><br>
		PHONE : <select name="memPHONE1">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="012">012</option>
		</select>
		 - <input type="text" name="memPHONE2" placeholder="4" size="4" value="${memberDTO.memPHONE2}">
		 - <input type="text" name="memPHONE3" placeholder="4" size="4" value="${memberDTO.memPHONE3}">
		 <button id="btnComplete">수정완료</button>
		 <button id="btnList">리스트로</button>
</form>
</body>
</html>