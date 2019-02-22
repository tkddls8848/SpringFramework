<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시큐리티 로그인</title>
</head>
<body>
	<h1>시큐리티 로그인</h1>
		<form action="/project/user/login_check.do" method="POST"><!-- 시큐리티 컨텍스트 -->
			ID : <input type="text" name="userid"><br>
			PW : <input type="password" name="passwd"><br>

			<input type="checkbox" name="_spring_security_remember_me" value="리멤버 미">
			
			<input type="submit" id="btnLogin" value="로그인">
			<input type="button" value="회원가입" onclick="join()">
		</form>
</body>
</html>
