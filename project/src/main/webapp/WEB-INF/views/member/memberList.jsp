<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
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
//
//function list(page){
//	location.href="/project/board/list?curPage="+page
//			+"&search_option=${map.search_option}"
//			+"&keyword=${map.keyword}";
//}

function list(page){
	location.href="/project/member/list?curPage="+page;
}
</script>
</head>
<body>
	<h1>회원목록</h1>
		<button id="btnLogout">로그아웃</button>
	<table>
		<thead>
			<tr>
				<td>아이디</td>
				<td>이메일</td>
				<td>전화번호</td>
			</tr>
		</thead>
		<tbody>
<!-- 		
			<c:forEach var="row" items="${map.list}">
				<tr>
					<td>${row.bno}</td>
					<td><a href="/project/board/view.do?bno=${row.bno}
					+&curPage=${map.pager.curPage}
					+&search_option=${map.search_option}
					+&keyword=${map.keyword}">${row.title}</a></td>
					<td>
						<c:if test="${row.cnt > 0}">
							<span style="color:red;">(${row.cnt})</span>
						</c:if>
					</td>
					<td>${row.regdate}</td>
					<td>${row.viewcnt}</td>
					<td>${row.nickName}</td>
				</tr>
			</c:forEach>
 -->			
			<c:forEach var="row" items="${list}">
				<tr>
					<td><a href="/project/member/view?memID=${row.memID}">${row.memID}</a></td>
					<td>${row.memEMAIL}</td>
					<td>${row.memPHONE1}-${row.memPHONE2}-${row.memPHONE3}</td>
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
	<input type="button" value="회원가입" id="btnInsert">

	<div>
		<input type="button" value="로그아웃" id="btnLogout">	
	</div>

		
</body>
</html>