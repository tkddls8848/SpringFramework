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

<script type="text/javascript">

function goPopup(){

	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrCoordUrl.do)를 호출하게 됩니다.
	var pop = window.open("${path}/user/jusoPopup.do?","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo,entX,entY){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		alert(roadFullAddr);
		document.form_juso.roadFullAddr.value = roadFullAddr;
		document.form_juso.roadAddrPart1.value = roadAddrPart1;
		document.form_juso.roadAddrPart2.value = roadAddrPart2;
		document.form_juso.addrDetail.value = addrDetail;
		document.form_juso.engAddr.value = engAddr;
		document.form_juso.jibunAddr.value = jibunAddr;
		document.form_juso.zipNo.value = zipNo;
		document.form_juso.admCd.value = admCd;
		document.form_juso.rnMgtSn.value = rnMgtSn;
		document.form_juso.bdMgtSn.value = bdMgtSn;
		document.form_juso.detBdNmList.value = detBdNmList;
		document.form_juso.bdNm.value = bdNm;
		document.form_juso.bdKdcd.value = bdKdcd;
		document.form_juso.siNm.value = siNm;
		document.form_juso.sggNm.value = sggNm;
		document.form_juso.emdNm.value = emdNm;
		document.form_juso.liNm.value = liNm;
		document.form_juso.rn.value = rn;
		document.form_juso.udrtYn.value = udrtYn;
		document.form_juso.buldMnnm.value = buldMnnm;
		document.form_juso.buldSlno.value = buldSlno;
		document.form_juso.mtYn.value = mtYn;
		document.form_juso.lnbrMnnm.value = lnbrMnnm;
		document.form_juso.lnbrSlno.value = lnbrSlno;
		document.form_juso.emdNo.value = emdNo;
		document.form_juso.entX.value = entX;
		document.form_juso.entY.value = entY;
		
		
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
	
	<form name="form1" action="/project/member/join" method="post">
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
			E-MAIL : <input type="email" name="memEMAIL"><br>
			PHONE : <select name="memPHONE1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="012">012</option>
					</select>
						 - <input type="text" name="memPHONE2" placeholder="4" size="4">
						 - <input type="text" name="memPHONE3" placeholder="4" size="4">
	<input type="submit" value="회원가입"><br>
	</form>
		<div id="map_canvas" align="center" style="height:300px; width:300px;">
		</div>

<form name="form_juso" id="form_juso" method="get">

	<input type="button" onClick="goPopup();" value="팝업_domainChk"/>
	<div id="list"></div>
	<div id="callBackDiv">
		<table>
			<tr><td>도로명주소 전체(포멧)</td><td><input type="text"  style="width:500px;" id="roadFullAddr"  name="roadFullAddr" /></td></tr>
			<tr><td>도로명주소           </td><td><input type="text"  style="width:500px;" id="roadAddrPart1"  name="roadAddrPart1" /></td></tr>
			<tr><td>고객입력 상세주소    </td><td><input type="text"  style="width:500px;" id="addrDetail"  name="addrDetail" /></td></tr>
			<tr><td>참고주소             </td><td><input type="text"  style="width:500px;" id="roadAddrPart2"  name="roadAddrPart2" /></td></tr>
			<tr><td>영문 도로명주소      </td><td><input type="text"  style="width:500px;" id="engAddr"  name="engAddr" /></td></tr>
			<tr><td>지번                 </td><td><input type="text"  style="width:500px;" id="jibunAddr"  name="jibunAddr" /></td></tr>
			<tr><td>우편번호             </td><td><input type="text"  style="width:500px;" id="zipNo"  name="zipNo" /></td></tr>
			<tr><td>행정구역코드        </td><td><input type="text"  style="width:500px;" id="admCd"  name="admCd" /></td></tr>
			<tr><td>도로명코드          </td><td><input type="text"  style="width:500px;" id="rnMgtSn"  name="rnMgtSn" /></td></tr>
			<tr><td>건물관리번호        </td><td><input type="text"  style="width:500px;" id="bdMgtSn"  name="bdMgtSn" /></td></tr>
			<tr><td>상세번물명        	</td><td><input type="text"  style="width:500px;" id="detBdNmList"  name="detBdNmList" /></td></tr>
			<tr><td>건물명        		</td><td><input type="text"  style="width:500px;" id="bdNm"  name="bdNm" /></td></tr>
			<tr><td>공동주택여부       </td><td><input type="text"  style="width:500px;" id="bdKdcd"  name="bdKdcd" /></td></tr>
			<tr><td>시도명        		</td><td><input type="text"  style="width:500px;" id="siNm"  name="siNm" /></td></tr>
			<tr><td>시군구명        	</td><td><input type="text"  style="width:500px;" id="sggNm"  name="sggNm" /></td></tr>
			<tr><td>읍면동명        	</td><td><input type="text"  style="width:500px;" id="emdNm"  name="emdNm" /></td></tr>
			<tr><td>법정리명        	</td><td><input type="text"  style="width:500px;" id="liNm"  name="liNm" /></td></tr>
			<tr><td>도로명        		</td><td><input type="text"  style="width:500px;" id="rn"  name="rn" /></td></tr>
			<tr><td>지하여부        	</td><td><input type="text"  style="width:500px;" id="udrtYn"  name="udrtYn" /></td></tr>
			<tr><td>건물본번        	</td><td><input type="text"  style="width:500px;" id="buldMnnm"  name="buldMnnm" /></td></tr>
			<tr><td>건물부번        	</td><td><input type="text"  style="width:500px;" id="buldSlno"  name="buldSlno" /></td></tr>
			<tr><td>산여부        		</td><td><input type="text"  style="width:500px;" id="mtYn"  name="mtYn" /></td></tr>
			<tr><td>지번본번(번지)     </td><td><input type="text"  style="width:500px;" id="lnbrMnnm"  name="lnbrMnnm" /></td></tr>
			<tr><td>지번부번(호)       </td><td><input type="text"  style="width:500px;" id="lnbrSlno"  name="lnbrSlno" /></td></tr>
			<tr><td>읍면동일련번호		</td><td><input type="text"  style="width:500px;" id="emdNo"  name="emdNo" /></td></tr>
			<tr><td>X 좌표       		</td><td><input type="text"  style="width:500px;" id="entX"  name="entX" /></td></tr>
			<tr><td>Y 좌표       		</td><td><input type="text"  style="width:500px;" id="entY"  name="entY" /></td></tr>
		</table>
	</div>

</form>
		
		
</body>
</html>
