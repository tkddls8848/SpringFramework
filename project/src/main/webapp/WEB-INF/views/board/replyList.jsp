<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- _csrf_ajax 헤더 -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>ReplyList</title>
</head>
<body>

ReplyList
${list}

	<c:forEach var="row" items="${list}">
		<tr>
			<td>
				${row.name}
				${row.regdate}
				<br>
				${row.replytext}
			</td>
		</tr>
	</c:forEach>

</body>
</html>