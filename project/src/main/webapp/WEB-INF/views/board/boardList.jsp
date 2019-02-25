<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/board/write";
	});
});
</script>
</head>
<body>
	<table>
	<thead>
		<tr>
			<td>bno</td>
			<td>title</td>
			<td>content</td>
			<td>regdate</td>
			<td>viewcnt</td>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="row" items="${map.list}">
		<tr>
			<td>${row.bno}</td>
			<td>${row.title}</td>
			<td>${row.content}</td>
			<td>${row.regdate}</td>
			<td>${row.viewcnt}</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	
	<input type="button" value="글쓰기" id="btnWrite">

</body>
</html>