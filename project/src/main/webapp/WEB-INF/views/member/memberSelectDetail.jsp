<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(function() {
		$("#btnModify").click(function() {
			document.form.action = "/project/member/update";
			document.form.submit();
		});
		$("#btnDelete").click(function() {
			document.form.action = "/project/member/delete";
			document.form.submit();
		});
	});
</script>
</head>
<body>
<form name="form" method="post">
		ID : <input type="text" name="memID" value="${memberDTO.memID}" readonly><br>
		PW : <input type="password" name="memPW" value="" readonly><br>
		E-MAIL : <input type="email" name="memEMAIL" value="${memberDTO.memEMAIL}" readonly><br>
		PHONE : <select name="memPHONE1" value="${memberDTO.memPHONE1}">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="012">012</option>
		</select>
		 - <input type="text" name="memPHONE2" placeholder="4" size="4" value="${memberDTO.memPHONE2}" readonly>
		 - <input type="text" name="memPHONE3" placeholder="4" size="4" value="${memberDTO.memPHONE3}" readonly>
		 
		 <button id="btnModify">수정하기</button>
		 <button id="btnDelete">삭제</button>
		 <div>${message}</div>
</form>
</body>
</html>