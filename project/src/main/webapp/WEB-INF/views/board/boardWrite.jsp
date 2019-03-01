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
<title>BoardWrite</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="../ckeditor/ckeditor.js"></script>

</head>
<body>
BoardWrite
<hr>

<!--  
배포디렉토리
<%=application.getRealPath("/") %> + \WEB-INF\views\images\
<hr>
		<div>
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
		<textarea name="content" id="content" cols="80" rows="3" placeholder="내용을 입력하세요"></textarea>
			<script>
				CKEDITOR.replace("content", {
					filebrowserUploadUrl : "/project/board/imageUpload.do?${_csrf.parameterName}=${_csrf.token}"
				});
			</script>
		</div>
-->
		
<form action="/project/board/insert.do" method="POST">
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
	<div>
		글쓴이는 세션에 아이디
		<input type="text" name="memID" id="memID" placeholder="아이디를 입력하세요">
	</div>
	<div>
		제목
		<input type="text" name="title" id="title" placeholder="제목을 입력하세요">
	</div>
	<div>
		내용
		<textarea type="text" name="content" id="content" placeholder="나용을 입력하세요"></textarea>
	</div>
	<div>
		첨부파일
		<div class="fileDrop"></div>
		<div id="uploadedList"></div>
	</div>
	<div>
		<a href="/project/board/write.do"><input type="button" id="btnWrite" value="수정">세션별 설정</a>
		<a href="/project/board/delete.do"><input type="button" id="btnDelete" value="삭제">세션별 설정</a>
		<a href="/project/board/list"><input type="button" id="btnList" value="목록"></a>	
	</div>
	<div>
	<input type="submit" id="btnSave">확인
	</div>
</form>
</body>
</html>