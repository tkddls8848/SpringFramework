<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="../include/header.jsp" %>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<script type="text/javascript">
	
		function join(){
			location.href="/project/user/join.do";
		}
	</script>
	<title>시큐리티 로그인</title>
</head>
<body>
	<div class="container">
		<span style="color:red">${errMsg}</span> 
		<form class="form-signin" action="/project/user/login_check.do" method="POST">
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
			<h2 class="form-signin-heading">시큐리티 로그인</h2>
				<label for="inputEmail" class="sr-only">ID</label>			
					<input type="text" name="userid" id="userid" class="form-control" placeholder="ID" required autofocus>
				<label for="inputPassword" class="sr-only">PW</label>
					<input type="password" name="passwd" id="passwd" class="form-control" placeholder="Password" required>
			<div class="checkbox">
				<label>
					<input type="checkbox" name="_spring_security_remember_me">로그인 유지
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" id="btnLogin" type="submit">로그인</button>
			<button class="btn btn-lg btn-normal btn-block" type="button" onclick="join()">회원가입</button>	
		</form>
	</div>
	
	<div>
		<%@ include file="../include/footer.jsp" %>	
	</div>
</body>
</html>
