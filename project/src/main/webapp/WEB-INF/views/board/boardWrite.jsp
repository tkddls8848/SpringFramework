<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../include/header.jsp" %>
<title>BoardWrite</title>
</head>
<body>

<h3>새로운 글쓰기</h3>
사용자명 : ${userid}
<br>
	<form action="/project/board/insert.do" method="get">
	    <div class="table-responsive">
	    	<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">	
	    	<input type="hidden" id=userid name="userid" value="${userid}">
			<table class="table table-striped">
				<tr>
					<td>작성자명</td>
					<td>${userid}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" id="title" value="${dto.title}"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" id="content" cols="80" rows="3">${dto.content}</textarea></td>
				</tr>
			</table>
			<div>
				<input type="submit" class="btn btn-primary" id="btnSave">
				<input type="reset" id="btnDelete"  class="btn btn-secondary" value="초기화">
				<a href="/project/board/list"><input type="button"  class="btn btn-secondary" id="btnList" value="목록화면"></a>	
			</div>
		</div>	
	</form>	
	<div>
		<%@ include file="../include/footer.jsp" %>	
	</div>
</body>
</html>
