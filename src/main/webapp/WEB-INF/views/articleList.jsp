<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기사 목록</title>
</head>
<body>
	<h2>게시판</h2>
	<form method=post action='articleList'>
		<span> 검색 찬스 </span>
		<input type=text name=title size=70 maxlength=70>
		<input type=submit value = "검색" >
	</form>
	
	<table cellspacing = 1  border = 1 width=750> 
		<tr align=center>
			<td width = 50>번호</td>
			<td width = 500>제목</td>
			<td width = 100>작성자</td>
			<td width = 100>등록일</td>
		</tr>
		
		<c:forEach var="Articles" items="${ArticleItems}" varStatus="status">
			<tr align=center>
			    <td width = 50><c:out value="${Articles.id}"/></td>
				<td width = 500><a href = '/articleBoard/selectedArticle/${Articles.id}'><c:out value="${Articles.title}"/></a></td>
				<td width = 100><c:out value="${Articles.writer}"/></td>
				<td width = 100><c:out value="${fn:substring(Articles.updateDate,0,11)}"/></td>
			</tr>
		</c:forEach>
	</table>
	
	<input type = button value = "등록" onclick = "location.href='/articleBoard/articleSubmitForm'">
	
	<div class="text-center">
		
		<a href='/articleBoard/articleList/${ArticlePagination.ppPage}'><c:out value="<<"/></a>
		<a href='/articleBoard/articleList/${ArticlePagination.pPage}'><c:out value="<"/></a>

		<c:forEach var="i" begin="${ArticlePagination.startPage}" end="${ArticlePagination.lastPage}">
		  <b><a href = '/articleBoard/articleList/${i - 1}'>${i}</a></b>
		</c:forEach>
	
		<a href='/articleBoard/articleList/${ArticlePagination.nPage}'><c:out value=">"/></a>
		<a href='/articleBoard/articleList/${ArticlePagination.nnPage}'><c:out value=">>"/></a>

	</div>

</body>
</html>