<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<style type="text/css">
table {
	boarder: 1px solid black;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(function() {
		$("#btnInsert").click(function() {
			location.href = "/project/member/insert";
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
				<td>이메일</td>
				<td>전화번호</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
				<tr>
					<td><a href="/project/member/view?memID=${row.memID}">${row.memID}</a></td>
					<td>${row.memEMAIL}</td>
					<td>${row.memPHONE1}-${row.memPHONE2}-${row.memPHONE3}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<input type="button" value="회원가입" id="btnInsert">
</body>
</html>