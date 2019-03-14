<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/header.jsp" %>

<script type="text/javascript">
$(function(){
	$("#btnGoLogin").click(function(){
		location.href="/project/";
	});
	
	$("#btnCheckuserid").click(function(){
		var userid = $("#userid").val();
		
		$.ajax({
			type:'post',
			data:{userid : userid},
			url:"/project/user/idCheck.do",
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
				<input type="text" name="address" id="address" class="form-control" placeholder="주소">
				<input type="button" onclick="execDaumPostcode()" value="주소 검색"><br>
				<input type="text" name="name" id="name" class="form-control" placeholder="사용자이름" required>
				<select name="authority" class="form-control" required>
					<option value="ROLE_USER">일반사용자</option>
					<option value="ROLE_ADMIN">관리자</option>
				</select>	
			<button class="btn btn-lg btn-primary btn-block" id="btnJoin" type="submit">회원가입</button>
			<button class="btn btn-lg btn-normal btn-block" id="btnGoLogin" type="button">로그인 화면으로</button>	
		</form>
	</div>
	

	<div style="text-align: center;">
		<div id="map" style="height:300px; width:300px; display:inline-block;">
		</div>
	</div>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f6018786c8ac12cf66764c56c734373a&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
	<div>
		<%@ include file="../include/footer.jsp" %>	
	</div>
</body>
</html>
