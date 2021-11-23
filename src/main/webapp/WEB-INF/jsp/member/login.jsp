<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="회원 로그인" />
<%@ include file="../part/head.jspf"%>
<script>
	function submitLoginForm(form) {
		form.loginId.value = form.loginId.value.trim();
		if (form.loginId.value.length == 0) {
			alert('로그인 아이디를 입력해주세요.');
			form.loginId.focus();
			
			return false;
		}

		if (form.loginId.value.length < 4) {
			alert('로그인 아이디를 4자 이상 입력해주세요.');
			form.loginId.focus();
			
			return false;
		}

		if (isAlphaNumeric(form.loginId.value) == false) {
			alert('로그인 아이디를 영어로 입력해주세요.');
			form.loginId.focus();
			return false;
		}
		//아이디 소문자
		form.loginId.value = form.loginId.value.toLowerCase();

		form.loginPw.value = form.loginPw.value.trim();
		if (form.loginPw.value.length == 0) {
			alert('로그인 비밀번호를 입력해주세요.');
			form.loginPw.focus();
			return false;
		}

		form.submit();
	}
</script>
<div class="member-join con table-box">
		<form class="table-box form form-type-1"
				onsubmit="submitLoginForm(this); return false;"
				action="/member/doLogin" method="POST">
				<table>
						<colgroup>
								<col width="150" />
						</colgroup>
						<tbody>
								<tr>
										<th>아이디</th>
										<td><input maxlength="30" name="loginId" type="text"
												autofocus="autofocus" placeholder="아이디를 입력해주세요." /></td>
								</tr>

								<tr>
										<th>비빌번호</th>
										<td><input maxlength="30" name="loginPw" type="password"
												placeholder="패스워드를 입력해주세요." /></td>
								</tr>


								<tr>
										<th>로그인</th>
										<td><input type="submit" value="로그인" /> <input
												onclick="history.back();" type="button" value="취소" /></td>
								</tr>
						</tbody>
				</table>
		</form>
</div>
<%@ include file="../part/foot.jspf"%>