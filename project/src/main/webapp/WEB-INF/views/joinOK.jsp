<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>JoinOK</title>
</head>
<body>

	<h1>JoinOK</h1>

	<P>ID is ${mem.memID}.</P><br>
	<P>PW is ${mem.memPW}.</P><br>
	<P>EMAIL is ${mem.memEMAIL}.</P><br>
	<P>PHONE is (${mem.memPHONE1}) ${mem.memPHONE2} ${mem.memPHONE3}.</P>
	
	<p>${servertime}</p>
</body>
</html>
