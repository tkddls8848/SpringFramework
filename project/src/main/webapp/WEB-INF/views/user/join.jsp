<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/header.jsp" %>
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
<!--  		
<div id="map_canvas" align="center" style="height:300px; width:300px;">
</div>
-->
	<div>
		<%@ include file="../include/footer.jsp" %>	
	</div>
</body>
</html>
