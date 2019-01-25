<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello!</h1>

	<form action="/project/login.jsp" method="get">
		<div>
			ID : <input type="text">
		</div>
		<div>
			PW : <input type="password">
		</div>
	</form>
	<input type="submit" value="login"><br>
	<a href="/project/join.jsp">join</a>

</body>
</html>
