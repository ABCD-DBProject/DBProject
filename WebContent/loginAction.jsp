<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> 
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String EMPID = request.getParameter("EMPID"); 
	String EMPPW = request.getParameter("EMPPW"); 
	
	UserDAO userDAO = new UserDAO(); 
	
	int result = userDAO.login(EMPID, EMPPW);
	
	if(result == 1) { 
		session.setAttribute("EMPID", EMPID); 
		PrintWriter script = response.getWriter(); 
		script.println("<script>"); 
		script.println("alert('로그인 성공')"); 
		script.println("location.href = 'attendance.jsp'"); 
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
		script.println("location.href = 'login.jsp'"); 
		script.println("</script>"); 
	} 
	else if(result == -1) { 
		PrintWriter script = response.getWriter(); 
		script.println("<script>"); 
		script.println("alert('서버 오류 입니다.')"); 
		script.println("location.href = 'login.jsp'"); 
		script.println("</script>"); 
	}	
	%>
</body>
</html>