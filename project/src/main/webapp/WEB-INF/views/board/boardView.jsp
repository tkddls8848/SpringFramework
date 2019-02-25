<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardWrite</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="../ckeditor/ckeditor.js"></script>
<style>
.filedrop{
	width:600px;
	height:100px;
	boarder:1px dotted gray;
	background-color:gray;
}
</style>
</head>
<body>
BoardList


	<div>
		글쓴이는 세션에 아이디
		<input type="text" name="nickName" id="nickName" value="${dto.memID}" placeholder="제목을 입력하세요" readonly>
	</div>
	<div>
		제목
		<input type="text" name="title" id="title" value="${dto.title}" placeholder="제목을 입력하세요" readonly>
	</div>
	<div>
		내용
		<textarea name="content" id="content" cols="80" rows="3" placeholder="내용을 입력하세요" readonly>${dto.content}</textarea>
	</div>
	<script>
	CKEDITER.replace("content",{
		filebrowserUploadUrl: "/board/upload.do",
		height : "150px"
	});
	</script>
	<div>
		첨부파일
		<div class="fileDrop"></div>
		<div id="uploadedList"></div>
	</div>
	<div>
	<input type="submit" id="btnSave">확인
	</div>
	<div>
		<a href="/project/board/write.do"><input type="button" id="btnWrite" value="수정">세션별 설정</a>
		<a href="/project/board/delete.do"><input type="button" id="btnDelete" value="삭제">세션별 설정</a>
		<a href="/project/board/list"><input type="button" id="btnList" value="목록"></a>	
	</div>

</body>
</html>