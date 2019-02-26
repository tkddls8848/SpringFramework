<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnLogout").click(function(){
		location.href="/project/logout.do";
	});
});
</script>
<title>Insert title here</title>
</head>
<body>
관리자페이지입니다. 	
<button id="btnLogout">로그아웃</button>
</body>
</html>