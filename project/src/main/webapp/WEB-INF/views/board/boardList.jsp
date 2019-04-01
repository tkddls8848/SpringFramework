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
	})
	
	$("#btnAdmin").click(function() {
		location.href = "/project/member/list";
	})
})

function list(page){
	location.href="/project/board/list?curPage="+page
			+"&search_option=${map.search_option}"
			+"&keyword=${map.keyword}";
}

</script>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">안녕하세요${principal.username}님.</h1>
			<p>${map.count}개의 게시물이 있습니다.</p>
		</div>
	</div>

	<sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
		<button id="btnAdmin" class="btn btn-primary pull-left" >관리자페이지</button>
	</sec:authorize>


	<form name="form" class="form-inline mt-2 mt-md-0" method="get" action="/project/board/list">
		<input name="${_csrf.parameterName}" class="form-control mr-sm-2" aria-label="Search" type="hidden" value="${_csrf.token}">
		<div class="container">
			<select name="search_option" class="form-control">
				<option value="all">모두</option>
				<option value="userid">이름</option>
				<option value="content">내용</option>
				<option value="title">제목</option>
			</select>		
			<input type="text" name="keyword" value="${map.keyword}">
			<input type="submit" value="검색" class="btn btn-outline-success my-2 my-sm-0" >
		</div>
	</form>
	
    <div class="table-responsive">
	<table class="table table-striped">
	<thead>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>댓글</td>
			<td>게시일</td>
			<td>조회수</td>
			<td>작성자</td>
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
			</td>
			<td><fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"></fmt:formatDate></td>
			<td>${row.viewcnt}</td>
			<td>${row.userid}</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="6">
		<div class="text-center">
			<ul class="pagination">
				<li>			
					<c:if test="${map.pager.curBlock > 1}">
					<a href="javascript:list('1')">[처음]</a>
					</c:if>
				</li>
				<li>
					<c:if test="${map.pager.curBlock > 1}">
					<a href="javascript:list('${map.pager.prevPage}')">[이전]</a>
					</c:if>
				</li>
				<li>
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
				</li>
				<li>
					<c:if test="${map.pager.curBlock <= map.pager.totBlock}">
					<a href="javascript:list('${map.pager.nextPage}')">[다음]</a>
					</c:if>
				</li>											
				<li>			
					<c:if test="${map.pager.curPage <= map.pager.totPage }">
					<a href="javascript:list('${map.pager.totPage}')">[끝]</a>
					</c:if>
				</li>				
			</ul>
		</div>
		</td>
	</tr>
	</tbody>
	</table>
	</div>
	<input type="button" class="btn btn-primary" value="글쓰기" id="btnWrite">
	<div>
		<%@ include file="../include/footer.jsp" %>	
	</div>
</body>
</html>