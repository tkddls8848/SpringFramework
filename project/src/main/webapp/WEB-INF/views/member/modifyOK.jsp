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

	<h1>modifyOK</h1>

	<h2>modify INFO</h2>

	<P>ID is ${memINFO.memID}.</P><br>
	<P>PW is ${memINFO.memPW}.</P><br>
	<P>EMAIL is ${memINFO.memEMAIL}.</P><br>
	<P>PHONE is (${memINFO.memPHONE1}) ${memINFO.memPHONE2} ${memINFO.memPHONE3}.</P>
	
	<p>${servertime}</p>
	
	<a href="/project/member/main">MAIN</a>
</body>
</html>
