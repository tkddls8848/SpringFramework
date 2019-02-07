<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginOK</title>
<style type="text/css">
table {
	boarder: 1px solid black;
}
</style>
</head>
<body>

	<h1>LoginOK</h1>

	<P>ID is ${member.memID}.</P>
	<br>
	<P>PW is ${member.memPW}.</P>

	<a href="/project/member/main">MAIN</a>

</body>
</html>
