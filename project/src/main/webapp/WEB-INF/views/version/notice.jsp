<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<!-- _csrf_ajax 헤더 -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<meta charset="UTF-8">
</head>
<body>
	공지사항
	<h3>자세한 commit내역은 깃허브 저장소사이트에 있습니다.</h3>
	<h5><a href="https://github.com/tkddls8848">깃허브 저장소</a></h5><br>

	<div class="table-responsive">
		<table class="table table-striped">
			<tr>
				<td>
				SpringFramework에 기반한 게시판 홈페이지 입니다<br>
				
				<h5>작업환경</h5><br>		
				Language : java JDK 1.8.0 u201, javascript, jQuery<br>
				View design : bootstrap<br>
				IDE : Eclipse 2018-12<br>
				DB : Oracle 11g xe<br>
				WAS : Tomcat 8.5<br>
				Framework : SpringFramework 4.3.2, Spring security 4.3.2.<br>
				Amazon Web Server : EC2(ubuntu) 인스턴스 구현 + RDS oracle DB 연동<br>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>