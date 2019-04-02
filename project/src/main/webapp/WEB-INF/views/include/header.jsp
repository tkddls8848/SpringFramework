<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- _csrf_ajax 헤더 -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 
<style>
/* footer */
html {
  position: relative;
  min-height: 100%;
}
body {
  margin-bottom: 60px; /* Margin bottom by footer height */
}
table {
	width : 800px;
}
.footer {
  position: absolute;
  bottom: 0;
  width: 100%;
  height: 60px; /* Set the fixed height of the footer here */
  line-height: 60px; /* Vertically center the text there */
  background-color: #f5f5f5;
}
</style>
<title>포트폴리오 사이트</title>
<nav class="navbar navbar-default">
<sec:authentication var="principal" property="principal"></sec:authentication>
	<div class="container-fluid">
		<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapsed"
		data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> 
			<span class="sr-only"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/project/">포트폴리오(홈)</a>
		<a class="navbar-brand" href="/project/version/version">버전업데이트내역</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="https://github.com/tkddls8848">소개(깃허브)<span class="sr-only"></span></a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<sec:authorize access="isAuthenticated()">
						<a href="#" onclick="document.getElementById('logoutForm').submit();">로그아웃</a>
						<form id="logoutForm" action="/project/user/logout.do" method="POST">
							<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
						</form>
					</sec:authorize>
				</li>
				<li>
					<sec:authorize access="isAuthenticated()">
						<a href="${path}/member/view?userid=${principal.username}">${principal.username}</a>
					</sec:authorize>
				</li>
			</ul>
		</div>
	</div>
</nav>
