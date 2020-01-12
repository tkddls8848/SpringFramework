<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/header.jsp" %>
<meta charset="UTF-8" http-equiv="refresh" content="3, /project/">
</head>
<body>
<div class="col p-4 d-flex flex-column position-static">
		${errMsg}
		${roadFullAddr}
		<br>
		3초후 로그인 페이지로 이동합니다.
</div>

	<div>
		<%@ include file="../include/footer.jsp" %>	
	</div>
</body>
</html>
