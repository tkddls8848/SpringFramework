<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/header.jsp"%>
<meta charset="UTF-8">
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
	});
	$("#btnDelete").click(function(){
		$("#formDelete").submit();
	});
	$("#btnUpdate").click(function(){
		$("#formUpdate").submit();
	});
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
<div class="container">
	<div class="col-md-12">
	<h3>게시글 보기</h3>
	<br>
	<form id="formUpdate" action="/project/board/update.do">
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
							<td><input type="text" name="title" id="title" value="${dto.title}"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="content" id="content" cols="80" rows="3">${dto.content}</textarea></td>
						</tr>
					</table>
				</div>
	</form>
	
	<div>
		<button id="btnUpdate" class="btn btn-primary">수정</button>
		<a href="/project/board/list"><input type="button" class="btn btn-secondary" id="btnList" value="목록"></a>
		<button id="btnDelete" class="btn btn-danger pull-right">삭제</button>
	</div>
	
	<form id="formDelete" action="/project/board/delete.do">
		<input type="hidden" id="bno" name="bno" value="${dto.bno}">
	</form>
	
	<!-- 댓글 -->
	<div style="width:700px; text-align:center" class="table-responsive">
		<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성하세요."></textarea>
		<br>
		<button id="btnReply">댓글쓰기(ajax)</button>
	</div>
	<!-- 댓글표시영역 -->	
	<div id="listReply">
	</div> 
	</div>
</div>
	<div>
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>