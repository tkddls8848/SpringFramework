<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/header.jsp"%>
<meta charset="UTF-8">
<title>BoardView</title>
<script>
$(function(){
	listReply("1");
	$("#btnReply").click(function(){
		var replytext = $("#replytext").val();
		var bno = "${dto.bno}";
		var param = {"bno" : bno, "replytext" : replytext};
		
		$.ajax({
			type : "POST",
			data : param,
			url : "/project/reply/insert.do",
			beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");},
			success : function(){
				alert("등록완료");
				listReply("1");
			}
		});
	})
})


function listReply(num){
	$.ajax({
		type : "POST",
		url : "/project/reply/list.do?bno=${dto.bno}&curPage="+num,
		beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");},
		success : function(result){
			$("#listReply").html(result);
		}
	});
}

</script>
</head>
<body>
	<h3>게시글 보기</h3>
	사용자명 : ${userid}
	<br>
	<form action="/project/board/update.do">
		<input type="hidden" id="bno" name="bno" value="${dto.bno}">
		<div class="table-responsive">
			<table class="table table-striped">
				<tr>
					<td>글번호</td>
					<td>${dto.bno}</td>
				</tr>
				<tr>
					<td>작성자명</td>
					<td>${userid}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" id="title"
						value="${dto.title}"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" id="content" cols="80" rows="3">${dto.content}</textarea></td>
				</tr>
			</table>
			<input type="submit" id="btnUpdate" class="btn btn-primary"
				value="수정"> <a href="/project/board/list"><input
				type="button" class="btn btn-secondary" id="btnList" value="목록"></a>
		</div>
	</form>
	<form action="/project/board/delete.do">
		<input type="hidden" id="bno" name="bno" value="${dto.bno}"> <input
			type="submit" id="btnDelete" class="btn btn-danger pull-right"
			value="삭제">
	</form>

	
	<div style="width:700px; text-align:center">
		<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성하세요.ajax미구현상태"></textarea>
		<br>
		<button id="btnReply">댓글쓰기(ajax)</button>
	</div>
		
	<div id="listReply"></div> 

	<div>
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>