<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%
	// 세션초기화
	session.invalidate();
	// "로그아웃됨"  loginForm.jsp로 이동
%>
	<script>
		alert('로그아웃');
		location.href = 'login2.jsp';
	</script>