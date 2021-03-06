<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/header.jsp" %>
<meta charset="UTF-8">
<style type="text/css">
table {
	boarder: 1px solid black;
}
</style>
<script>
	$(function() {
		$("#btnInsert").click(function() {
			location.href = "/project/member/insert";
		});
		$("#btnLogout").click(function() {
			location.href = "/project/logout.do";
		});
	});
</script>
</head>
<body>
	<h1>회원목록</h1>
	<table>
		<thead>
			<tr>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>이메일</td>
				<td>전화번호</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
				<tr>
					<td><a href="/project/member/view?memID=${row.memID}">${row.memID}</a></td>
					<td>${row.memPW}</td>
					<td>${row.memEMAIL}</td>
					<td>${row.memPHONE1}-${row.memPHONE2}-${row.memPHONE3}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<input type="button" value="회원가입" id="btnInsert">
	
	<div id="loginWelcome">
		관리자()님 반갑습니다.
	</div>
	<div>
		<input type="button" value="로그아웃" id="btnLogout">	
	</div>
	<div>
		<%@ include file="../include/footer.jsp" %>	
	</div>
		
</body>
</html>