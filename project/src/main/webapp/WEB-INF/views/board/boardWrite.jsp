<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardWrite</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<body>

	<div>
		<h1>글쓰기</h1>
	</div>
	<form name="form" action="/board/insert" method="POST">
		<div>
			제목 <input type="text" id="title" name="title" size="50"
				placeholder="제목을 입력하세요">
		</div>

		<div>
			본문
			<textarea id="content" name="content" rows="5" cols="30"
				placeholder="내용을 입력하세요"></textarea>
		</div>

		<div>
			첨부파일을 놓으세요.<br>
			<button type="submit">저장</button>
		</div>
	</form>


</body>
</html>