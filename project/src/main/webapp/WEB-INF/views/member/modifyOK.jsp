<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JoinOK</title>
</head>
<body>

	<h1>modifyOK</h1>

	<h2>modify BEFORE</h2>

	<P>ID is ${memBefore.memID}.</P><br>
	<P>PW is ${memBefore.memPW}.</P><br>
	<P>EMAIL is ${memBefore.memEMAIL}.</P><br>
	<P>PHONE is (${memBefore.memPHONE1}) ${memBefore.memPHONE2} ${memBefore.memPHONE3}.</P>
	
	<h2>modify AFTER</h2>
	
	<P>ID is ${memAfter.memID}.</P><br>
	<P>PW is ${memAfter.memPW}.</P><br>
	<P>EMAIL is ${memAfter.memEMAIL}.</P><br>
	<P>PHONE is (${memAfter.memPHONE1}) ${memAfter.memPHONE2} ${memAfter.memPHONE3}.</P>
	
	<p>${servertime}</p>
	
	<a href="/project/member/main">MAIN</a>
</body>
</html>
