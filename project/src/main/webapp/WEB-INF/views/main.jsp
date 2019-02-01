<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Session</title>
</head>
<body>
	<h1>MAIN</h1>

	<c:if test="${empty session}">
	
	You`re not login.<br>
	
		<a href="/project/resources/html/member/memberJoin.html">Join</a>
		<a href="/project/resources/html/member/memberLogin.html">Login</a>
	</c:if>
	
	<c:if test="${!empty session}">
	
	Welcome $<br>
	
		<a href="/project/resources/html/member/memberModify.html">Modify</a>
		<a href="/project/resources/html/member/memberRemove.html">Remove</a>
		<a href="/project/member/logout">Logout</a>		
	</c:if>

</body>
</html>
