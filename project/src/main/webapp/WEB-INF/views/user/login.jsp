<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/header.jsp" %>
<meta charset="UTF-8">
<script type="text/javascript">
	function join(){
		location.href="/project/user/join.do";
	}
</script>
<!--구글 맵 API, key 발급-->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyASO-TtcmYDX1eNZRtTawpGPIa_te-uhN8&language=ko"></script>
<script> 
window.onload = function () {
	var myLatlng = new google.maps.LatLng(37.51619821, 127.1041016); // y, x좌표값 : 여기에 주소자료롤 받아 입력해야 함.
	var mapOptions = { 
	      zoom: 15, 
	      center: myLatlng, 
	      mapTypeId: google.maps.MapTypeId.ROADMAP 
	} 
	
	var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
	var marker = new google.maps.Marker({ 
	          position: myLatlng, 
	          map: map, 
	          title: "회사이름" 
	}); 
	var infowindow = new google.maps.InfoWindow( 
	        { 
	          content: "<h1>회사이름</h1>", 
	          maxWidth: 300 
	        } 
	); 
	google.maps.event.addListener(marker, 'click', function() { 
		infowindow.open(map, marker); 
	}); 
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
		
		<div id="map_canvas" align="center" style="height:300px; width:300px;">
		</div> 	
</body>
</html>
