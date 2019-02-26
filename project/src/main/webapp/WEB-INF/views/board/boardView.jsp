<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardWrite</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function(
	$(#btnReply).click(function(
		reply();	
	));	
));

function reply(){
	var replytext=${"#replytext"}.val();
	var bno="${dto.bno}";
	var param={"replytext" : replytext, "bno" : bno};
	$.ajax({
		type: "post",
		url: "/project/reply/insert.do",
		data: param,
		success: function(){
			alert("댓글이 등록되었습니다.");
		}
	});
}
</script>
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
	<div style="width:700px; text-align:center">
		c:if test="${sessionScope.userid != null }"작성요함
		<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성하세요."></textarea>
		<br>
		<input type="button" id="btnReply">댓글쓰기
		/c:if
	</div>
	<div id="listReply"></div>
</body>
</html>