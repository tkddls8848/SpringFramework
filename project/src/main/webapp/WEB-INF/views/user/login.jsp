<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function join(){
		location.href="/project/user/join.do";
	}
</script>
<title>시큐리티 로그인</title>
</head>
<body>
	<h1>시큐리티 로그인</h1>
	<span style="color:red">${errMsg}</span> 
		<form action="/project/user/login_check.do" method="POST"><!-- 시큐리티 컨텍스트 -->
			ID : <input type="text" name="userid"><br>
			PW : <input type="password" name="passwd"><br>

			<input type="checkbox" name="_spring_security_remember_me">Remember Me
			
			<input type="submit" id="btnLogin" value="로그인">
			<input type="button" value="회원가입" onclick="join()">
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">

		</form>
</body>
</html>
