<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../include/header.jsp" %>
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
	<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
	    <div class="table-responsive">
			<table class="table table-striped">
				<tr>
					<td>ID</td>
					<td><input type="text" name="userid" value="${memberDTO.userid}"></td>
				</tr>
				<tr>
					<td>E-MAIL</td>
					<td><input type="email" name="memEMAIL" value="${memberDTO.memEMAIL}" readonly></td>
				</tr>
				<tr>
					<td>PHONE</td>
					<td>
					<select name="memPHONE1" value="${memberDTO.memPHONE1}">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="012">012</option>
					</select>
					 - <input type="text" name="memPHONE2" placeholder="4" size="4" value="${memberDTO.memPHONE2}" readonly>
					 - <input type="text" name="memPHONE3" placeholder="4" size="4" value="${memberDTO.memPHONE3}" readonly>
					 </td>
				</tr>
			</table>
		</div>

		 <button id="btnModify">수정하기</button>
		 <button id="btnDelete">삭제</button>
		 <div>${message}</div>
</form>
	<div>
		<%@ include file="../include/footer.jsp" %>	
	</div>
</body>
</html>