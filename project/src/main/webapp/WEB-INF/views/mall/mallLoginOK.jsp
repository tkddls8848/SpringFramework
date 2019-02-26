<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>MallLogin</title>
</head>
<body>

	<h1>MallLoginOK</h1>
	
	당신은 ${mall.memGENDER} 매장에 오셨습니다.

	<c:choose>
		<c:when test="${mall.memGENDER == 'M'}">
			<p>MALE 매장입니다.</p>
		</c:when>
		<c:when test="${mall.memGENDER == 'F'}">
			<p>FEMALE 매장입니다.</p>
		</c:when>
		<c:otherwise>
				<p>UNISEX 매장입니다.</p>
		</c:otherwise>
	</c:choose>


	<p>${servertime}</p>
	
	<a href="/project/mall/main">exit</a>
	
</body>
</html>
