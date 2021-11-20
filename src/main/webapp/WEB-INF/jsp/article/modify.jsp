<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="게시물 수정" />    
<%@ include file="../part/head.jspf" %>
<script>
	function submitModifyForm(form) {
			form.title.value = form.title.value.trim();

			if(form.title.value.length == 0) {
					alert('제목을 입력해주세요.');
					form.title.focus();

					return false;
				}

			form.body.value = form.body.value.trim();

			if(form.body.value.length == 0) {
					alert('내용을 입력해주세요.');
					form.body.focus();

					return false;
				}
			form.submit();
		}
</script>
	<div class="article-modify con table-box">
		<form class="table-box form form-type-1" onsubmit="submitModifyForm(this); return false;" action="/article/doModify" method="POST">
		<input value="${article.id}" name="id" type="hidden" />
			<table>
				<colgroup>
					<col width="100" />
				</colgroup>
					<tbody>
						<tr>
							<th>번호</th>
							<td>${article.id}</td>
						</tr>					
					
						<tr>
							<th>제목</th>
							<td>
								<input value="${article.title}" name="title" type="text" autocomplete="off" autofocus="autofocus" placeholder="제목을 입력해주세요."/>
							</td>
						</tr>
						
						<tr>
							<th>내용</th>
							<td>
								<textarea  name="body" placeholder="내용을 입력해주세요." >${article.body}</textarea>
							</td>
						</tr>
						
						<tr>
							<th>수정</th>
							<td>
								<input type="submit" value="수정"/>
								<input onclick="history.back();" type="button" value="취소"/>
							</td>
						</tr>
					</tbody>
			</table>
		</form>
	</div>	
<%@ include file="../part/foot.jspf" %>