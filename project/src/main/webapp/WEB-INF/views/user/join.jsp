<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form name="form" action="/project/user/insertUser.do" method="post">
			ID : <input type="text" name="userid"><br>
			PW : <input type="password" name="passwd"><br>
			이름 : <input type="text" name="name"><br>
			사용권한
			<select name="authority">
				<option value="ROLE_USER">ROLE_USER</option>
				<option value="ROLE_ADMIN">ROLE_ADMIN</option>
			</select>		 
		<input type="submit" value="회원가입"><br>
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
	</form>
</body>
</html>
