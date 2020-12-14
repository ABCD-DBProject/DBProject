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
	String EMPNAME = request.getParameter("EMPNAME");
	String EMPID = request.getParameter("EMPID"); 
	String EMPPW = request.getParameter("EMPPW");
	String DNAME = request.getParameter("DNAME");
	String BIRTHDATE = request.getParameter("BIRTHDATE");
	String TEL = request.getParameter("TEL");	
	String EMAIL = request.getParameter("EMAIL");
	String SDATE = request.getParameter("SDATE");

	if(EMPNAME == null || EMPID == null || EMPPW == null || DNAME == null || EMAIL == null || BIRTHDATE == null || TEL == null || SDATE == null) { 
		PrintWriter script = response.getWriter(); 
		script.println("<script>"); 
		script.println("alert('빈칸을 확인해 주세요')"); 
		script.println("history.back()"); 
		script.println("</script>"); 
	} 
	else { 
		UserDAO userDAO = new UserDAO(); 
		userDAO.setEMPNAME(EMPNAME);
		userDAO.setEMPID(EMPID); 
		userDAO.setEMPPW(EMPPW);
		userDAO.setDNAME(DNAME);
		userDAO.setBIRTHDATE(BIRTHDATE); 
		userDAO.setTEL(TEL);	
		userDAO.setEMAIL(EMAIL); 
		userDAO.setSDATE(SDATE);
		
		int result = userDAO.join(userDAO); 
		if(result == -1) { 
			PrintWriter script = response.getWriter(); 
			script.println("<script>"); 
			script.println("alert('서버오류')"); 
			script.println("history.back()"); 
			script.println("</script>"); 
		} 
		else if(result == 0) { 
			PrintWriter script = response.getWriter(); 
			script.println("<script>"); 
			script.println("alert('이미 아이디가 존재합니다.')"); 
			script.println("history.back()"); 
			script.println("</script>"); 
		} 
		else { 
			PrintWriter script = response.getWriter(); 
			script.println("<script>"); 
			script.println("alert('회원가입을 축하드립니다.')"); 
			script.println("location.href ='login.jsp'"); 
			script.println("</script>"); 
		} 
	} 
	%>

</body>
</html>