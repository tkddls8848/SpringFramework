<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="../include/header.jsp" %>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
	<script type="text/javascript">
		function join(){
			location.href="/project/user/join.do";
		}
		function windowOpen(){
			window.open("/project/version/notice", "프로젝트 진행 내역", "width=800, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
		}
	</script>
</head>
<body>
	<div class="container" style="width:500px">
		<span style="color:red">${errMsg}</span> 
		<form class="form-signin" action="/project/user/login_check.do" method="POST">
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
			<h2 class="form-signin-heading">게시판 로그인</h2>
				<input type="text" name="userid" id="userid" class="form-control" placeholder="ID" required autofocus>
				<input type="password" name="passwd" id="passwd" class="form-control" placeholder="Password" required>
				<div class="checkbox">
					<label>
						<input type="checkbox" name="_spring_security_remember_me">로그인 유지
					</label>
				</div>
			<button class="btn btn-lg btn-primary btn-block" id="btnLogin" type="submit">로그인</button>
			<button class="btn btn-lg btn-normal btn-block" type="button" onclick="join()">회원가입</button>
			<div id="naver_id_login" style="text-align:center">
				<a href="${url}"><img width="223" src="${pageContext.request.contextPath}/resources/img/naver_Bn_Green.PNG"/></a>
			</div>
		</form>
	</div>

	<div>
		<%@ include file="../include/footer.jsp" %>	
	</div>
</body>
</html>
