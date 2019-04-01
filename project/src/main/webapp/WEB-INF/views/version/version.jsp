<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/header.jsp" %>
<meta charset="UTF-8">
<style>
  table {
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
  }
</style>
<title>버전업데이트내역</title>
</head>
<body>

<h3>자세한 commit내역은 깃허브 저장소사이트에 있습니다.</h3>
<h5><a href="https://github.com/tkddls8848">깃허브 저장소</a></h5>

	<table>
		<tr>
			<td>2019.03.04</td>
			<td>최초 AWS 배포시작</td>
		</tr>
		<tr>
			<td>2019.03.11</td>
			<td>회원가입페이지 수정, 아이디 비밀번호 확인기능 추가</td>
		</tr>
		<tr>
			<td>2019.03.13</td>
			<td>댓글 기능 보강</td>
		</tr>
		<tr>
			<td>2019.03.18</td>
			<td>네비게이션 바 로그인 로그아웃 기능 추가</td>
		</tr>
	</table>


<!-- 
	
<div id="map_canvas" style="width:300px;height:300px;margin-top:10px;"></div>	
구글 맵 API, key 발급
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASO-TtcmYDX1eNZRtTawpGPIa_te-uhN8&callback=initMap" async defer></script>
    <script>
      function initMap() {
    	var getLat = document.getElementById('entX').value;
    	var getLng = document.getElementById('entY').value;
        var myLatLng = {lat: 0, lng: 0};

        // Create a map object and specify the DOM element
        // for display.
        var map = new google.maps.Map(document.getElementById('map_canvas'), {
          center: myLatLng,
          zoom: 4
        });

        // Create a marker and set its position.
        var marker = new google.maps.Marker({
          map: map,
          position: myLatLng,
          title: 'Hello World!'
        });
      }

    </script>  
<script type="text/javascript">

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrCoordUrl.do)를 호출하게 됩니다.
	var pop = window.open("/project/version/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo,entX,entY){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.roadAddrPart2.value = roadAddrPart2;
		document.form.addrDetail.value = addrDetail;
		document.form.engAddr.value = engAddr;
		document.form.jibunAddr.value = jibunAddr;
		document.form.zipNo.value = zipNo;
		document.form.admCd.value = admCd;
		document.form.rnMgtSn.value = rnMgtSn;
		document.form.bdMgtSn.value = bdMgtSn;
		document.form.detBdNmList.value = detBdNmList;
		document.form.bdNm.value = bdNm;
		document.form.bdKdcd.value = bdKdcd;
		document.form.siNm.value = siNm;
		document.form.sggNm.value = sggNm;
		document.form.emdNm.value = emdNm;
		document.form.liNm.value = liNm;
		document.form.rn.value = rn;
		document.form.udrtYn.value = udrtYn;
		document.form.buldMnnm.value = buldMnnm;
		document.form.buldSlno.value = buldSlno;
		document.form.mtYn.value = mtYn;
		document.form.lnbrMnnm.value = lnbrMnnm;
		document.form.lnbrSlno.value = lnbrSlno;
		document.form.emdNo.value = emdNo;
		document.form.entX.value = entX;
		document.form.entY.value = entY;
		
		initMap();
}

</script>

<form name="form" id="form" method="post">

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
 -->
	<div>
		<%@ include file="../include/footer.jsp" %>	
	</div>
</body>
</html>