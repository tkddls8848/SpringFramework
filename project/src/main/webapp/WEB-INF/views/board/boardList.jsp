<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList</title>
<%@include file="../include/header.jsp" %>
<script>
$(function(){
	$("#btnWrite").click(function(){
		location.href="/project/board/write.do";
	});
	$("#btnAdmin").click(function() {
		location.href = "/project/admin/admin.do";
	});
	$("#btnMemberlist").click(function() {
		location.href = "/project/member/list";
	});
});

function list(page){
	location.href="/project/board/list?curPage="+page
			+"&search_option=${map.search_option}"
			+"&keyword=${map.keyword}";
}

</script>
</head>
<body>
	${map.count}개의 게시물이 있습니다.

	${map.pager.prevPage}
	${map.pager.nextPage}
	${map.pager.curPage}
	${map.pager.totPage}
	
	${map.pager.curBlock}
	${map.pager.blockBegin}
	${map.pager.blockEnd}
	<button id="btnAdmin">관리자페이지</button>	
	<button id="btnMemberlist">멤버리스트(관리자예정)</button>		
	<form name="form" method="get" action="/project/board/list">
	<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
		<select name="search_option">
			<option value="all">모두</option>
			<option value="nickName">이름</option>
			<option value="content">내용</option>
			<option value="title">제목</option>
		</select>
		<input type="text" name="keyword" value="${map.keyword}">
		<input type="submit" value="검색">
	</form>

	<table>
	<thead>
		<tr>
			<td>bno</td>
			<td>title</td>
			<td>reply</td>
			<td>regdate</td>
			<td>viewcnt</td>
			<td>nickName</td>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="row" items="${map.list}">
		<tr>
			<td>${row.bno}</td>
			<td><a href="/project/board/view.do?bno=${row.bno}
			+&curPage=${map.pager.curPage}
			+&search_option=${map.search_option}
			+&keyword=${map.keyword}">${row.title}</a></td>
			<td>
				<span>(${row.cnt})</span>
				<c:if test="${row.cnt > 0}">
					<span style="color:red;">(${row.cnt})</span>
				</c:if>
			</td>
			<td>${row.regdate}</td>
			<td>${row.viewcnt}</td>
			<td>${row.nickName}</td>
		</tr>
	</c:forEach>
	<tr>
		<td>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="javascript:list('1')">[처음]</a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="javascript:list('${map.pager.prevPage}')">[이전]</a>
			</c:if>
			<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
						<span style="color:red;">${num}</span>&nbsp;
					</c:when>
					<c:otherwise>
						<a href="javascript:list('${num}')">${num}</a>&nbsp;					
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock <= map.pager.totBlock}">
				<a href="javascript:list('${map.pager.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${map.pager.curPage <= map.pager.totPage }">
				<a href="javascript:list('${map.pager.totPage}')">[끝]</a>
			</c:if>
		</td>
	</tr>
	</tbody>
	</table>
	
	<input type="button" value="글쓰기" id="btnWrite">

</body>
</html>