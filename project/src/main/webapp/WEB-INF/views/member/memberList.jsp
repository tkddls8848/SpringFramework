<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
table {
	boarder: 1px solid black;
}
</style>
<%@include file="../include/header.jsp" %>
<script>
	$(function() {
		$("#btnInsert").click(function() {
			location.href = "/project/user/join.do";
		});
		$("#btnLogout").click(function() {
			location.href = "/project/logout.do";
		});
	});

function list(page){
	location.href="/project/member/list?curPage="+page;
}
</script>
</head>
<body>
	<h1>회원목록(관리자 전용)</h1>
<div class="table-responsive">
	<table class="table table-striped">
		<thead>
			<tr>
				<td>아이디</td>
				<td>이메일</td>
				<td>전화번호</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
				<tr>
					<td><a href="/project/member/view?userid=${row.userid}">${row.userid}</a></td>
					<td>${row.memEMAIL}</td>
					<td>${row.memPHONE1}-${row.memPHONE2}-${row.memPHONE3}</td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="3">
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

<div>
	<input type="button" class="btn btn-primary" value="회원가입" id="btnInsert">
	<input type="button" class="btn btn-secondary" value="로그아웃" id="btnLogout">	
</div>

	<div>
		<%@ include file="../include/footer.jsp" %>	
	</div>		
</body>
</html>