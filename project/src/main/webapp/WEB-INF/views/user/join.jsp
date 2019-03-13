<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/header.jsp" %>
<!--구글 맵 API, key 발급
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyASO-TtcmYDX1eNZRtTawpGPIa_te-uhN8&language=ko"></script>
-->
<script type="text/javascript">


$(function(){
	$("#btnGoLogin").click(function(){
		location.href="/project/";
	});
	
	$("#btnCheckuserid").click(function(){
		var userid = $("#userid").val();
		
		$.ajax({
			async:true,
			type:'post',
			data:{userid : userid},
			url:"/project/user/idCheck.do",
	        dataType : "json",
	        contentType: 'application/json',
	        beforeSend: function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		}).done(function(map){
			if(map.cnt >= 1){
				alert("아이디가 존재합니다.");
				$("#userid").val('');
				$("#checkCnt").val('0');
			} else {
				alert("생성 가능합니다.");
				$("#checkCnt").val('1');
			}
		}).fail(function(){
			alert("요청 실패");
		})
	})

});
</script>
<title>회원가입</title>
</head>
<body>
	<div class="container" style="width:500px">
		<form name="form" action="/project/user/insertUser.do" method="post">
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">		
			<input id="checkCnt" type="hidden" value="0">	 
			<h2 class="form-signin-heading">회원가입</h2>
				<input type="text" name="userid" id="userid" class="form-control" placeholder="ID" required autofocus>
						<button class="btn btn-normal btn-block" id="btnCheckuserid">ID체크</button>
				<input type="password" name="passwd" id="passwd" class="form-control" placeholder="Password" required>
				<input type="text" name="name" id="name" class="form-control" placeholder="사용자이름" required>
				<select name="authority" class="form-control" required>
					<option value="ROLE_USER">일반사용자</option>
					<option value="ROLE_ADMIN">관리자</option>
				</select>	
			<button class="btn btn-lg btn-primary btn-block" id="btnJoin" type="submit">회원가입</button>
			<button class="btn btn-lg btn-normal btn-block" id="btnGoLogin" type="button">로그인 화면으로</button>	
		</form>
	
	</div>

<!--  		
<div id="map_canvas" align="center" style="height:300px; width:300px;">
</div>
-->
	<div>
		<%@ include file="../include/footer.jsp" %>	
	</div>
</body>
</html>
