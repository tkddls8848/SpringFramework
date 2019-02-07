<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JoinOK</title>
<style type="text/css">
table {
	boarder: 1px solid black;
}
</style>
</head>
<body>

	<h1>JoinOK</h1>

	<table>
		<tr>
			<td colspan="3">ID is ${mem.memID}.</td>
		</tr>
		<tr>
			<td colspan="3">PW is ${mem.memPW}.</td>
		</tr>
		<tr>
			<td colspan="3">EMAIL is ${mem.memEMAIL}.</td>
		</tr>
		<tr>
			<td>PHONE is (${mem.memPHONE1})</td>
			<td>${mem.memPHONE2}</td>
			<td>${mem.memPHONE3}.</td>
		</tr>
	</table>


	<P></P>
	<br>
	<P></P>
	<br>
	<P></P>
	<br>
	<P></P>

	<p>${servertime}</p>

	<a href="/project/member/main">Main</a>

</body>
</html>
