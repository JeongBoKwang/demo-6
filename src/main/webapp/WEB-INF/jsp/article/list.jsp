<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="게시물 리스트" />    
<%@ include file="../part/head.jspf" %>

<div class="article-list-box con table-box">
		<table>
			<colgroup>
				<col width="10"/>
				<col width="200"/>
				<col />
				<col width="150"/>
			</colgroup>
			<thead>
				<tr>
					<th>ID</th>
					<th>날짜</th>
					<th>제목</th>
					<th>비고</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${articles}" var="article">
					<tr>
						<td>${article.id}</td>
						<td>${article.regDate}</td>
						<td><a href="./detail?id=${article.id}">${article.title}</a></td>
						<td>
							<c:if test="${isLogined}">
							<a href="./modify?id=${article.id}">수정하기</a>
							<a href="./doDelete?id=${article.id}" onclick="if(confirm('삭제하시겠습니다?') == false )return false;">삭제</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>	
<%@ include file="../part/foot.jspf" %>