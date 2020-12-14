<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.ManDAO" %> 
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String MANID = request.getParameter("MANID"); 
	String MANPW = request.getParameter("MANPW"); 
	
	ManDAO manDAO = new ManDAO(); 
	
	int result = manDAO.login(MANID, MANPW);
	
	if(result == 1) { 
		session.setAttribute("MANID", MANID); 
		PrintWriter script = response.getWriter(); 
		script.println("<script>"); 
		script.println("alert('로그인 성공')"); 
		script.println("location.href = 'index1.jsp'"); 
		script.println("</script>"); 
	} 
	else if(result == 0) { 
		PrintWriter script = response.getWriter(); 
		script.println("<script>"); 
		script.println("alert('비밀번호가 틀립니다.')"); 
		script.println("history.back()"); 
		script.println("</script>"); 
	} 
	else if(result == -2) { 
		PrintWriter script = response.getWriter(); 
		script.println("<script>"); 
		script.println("alert('아이디를 확인해주세요.')"); 
		script.println("location.href = 'login2.jsp'"); 
		script.println("</script>"); 
	} 
	else if(result == -1) { 
		PrintWriter script = response.getWriter(); 
		script.println("<script>"); 
		script.println("alert('서버 오류 입니다.')"); 
		script.println("location.href = 'login2.jsp'"); 
		script.println("</script>"); 
	}	
	%>
</body>
</html>