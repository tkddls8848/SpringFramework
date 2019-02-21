<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h1>로그인</h1>
		<form action="/project/login">
			ID : <input type="text" name="memID"><br>
			PW : <input type="password" name="memPW"><br>
			<input type="submit" id="btnLogin" value="로그인">
		</form>

		 메세지가 올 곳입니다.
		 <c:if test="${message == 'error'}">
			 <div>아이디 오류</div>
		 </c:if>

</body>
</html>
