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
	</table>

	<div>
		<%@ include file="../include/footer.jsp" %>	
	</div>
</body>
</html>