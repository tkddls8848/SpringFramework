<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- _csrf_ajax 헤더 -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
</head>
<body>

<h4>댓글 목록</h4>
<table class="table table-striped">
	<c:forEach var="row" items="${list}">
		<tr>
			<td>
				${row.name}<br>
				<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"></fmt:formatDate><br>
				${row.replytext}
			</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>