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
<script>
$(function(){
	listReply("1");//1페이지 댓글 목록 뿌리기
	$("#btnReply").click(function(){
		reply();
	});
});

function reply(){
	var replytext=$("#replytext").val();
	var bno="${dto.bno}";
	var param={"replytext" : replytext, "bno" : bno};
	$.ajax({
		type: "post",
		url: "/project/reply/insert.do",
		data: param,
		beforeSend : function(xhr)
        {  
            xhr.setRequestHeader("${_csrf_header}", "${_csrf}");
        },
		success: function(){
			alert("댓글이 등록되었습니다.");
			listReply("1");//댓글 갱신 후 목록 다시 뿌리기
		}
	});
}


function listReply(num){
	$.ajax({
		type: "post",
		url: "/project/reply/list.do?bno=${dto.bno}&curPage=" + num,
		beforeSend : function(xhr)
        {  
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success: function(result){
			alert(result);
			$("#listReply").html(result);
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
		${userid}
<hr>
	<div>
		${dto.memID}
	</div>
	<div>
		제목
		<input type="text" name="title" id="title" value="${dto.title}" readonly>
	</div>
	<div>
		내용
		<textarea name="content" id="content" cols="80" rows="3" readonly>${dto.content}</textarea>
	</div>
	<div>
		첨부파일
		<div class="fileDrop"></div>
		<div id="uploadedList"></div>
	</div>
	<div>
		<input type="submit" id="btnSave">
		<a href="/project/board/list"><input type="button" id="btnList" value="목록"></a>	
	</div>
	<hr>
	<div style="width:700px; text-align:center">
		<c:if test="${userid != null}">
		<form action="/project/reply/insert.do" method="post">
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
			<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성하세요.ajax미구현상태"></textarea>
			<br>
			<input type="button" id="btnReply" value="댓글쓰기(ajax)">
			<input type="hidden" id="bno" name="bno" value="${dto.bno}">
		</form>
			<a href="/project/board/write.do"><input type="button" id="btnWrite" value="수정"></a>
			<a href="/project/board/delete.do"><input type="button" id="btnDelete" value="삭제"></a>
			<a href="/project/board/list"><input type="button" id="btnList" value="목록"></a>
		</c:if>
	</div>
	
	<div id="listReply"></div>
</body>
</html>