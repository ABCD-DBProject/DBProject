<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.HolidayDAO" %> 
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	int EMPNO = Integer.parseInt(request.getParameter("EMPNO"));
	String DNAME = request.getParameter("DNAME");
	String HTYPE = request.getParameter("HTYPE");
	String START_TIME = request.getParameter("START_TIME");
	String END_TIME = request.getParameter("END_TIME");
	
	
	if(HTYPE == null || START_TIME == null || END_TIME == null) { 
		PrintWriter script = response.getWriter(); 
		script.println("<script>"); 
		script.println("alert('빈칸을 확인해 주세요')"); 
		script.println("history.back()"); 
		script.println("</script>"); 
	} 
	else { 
		HolidayDAO holidayDAO = new HolidayDAO(); 
		holidayDAO.setEMPNO(EMPNO);
		holidayDAO.setDNAME(DNAME);
		holidayDAO.setHTYPE(HTYPE);
		holidayDAO.setSTART_TIME(START_TIME);
		holidayDAO.setEND_TIME(END_TIME);
		
		int result = holidayDAO.request(holidayDAO); 
		if(result == -1) { 
			PrintWriter script = response.getWriter(); 
			script.println("<script>"); 
			script.println("alert('서버오류')"); 
			script.println("history.back()"); 
			script.println("</script>"); 
		} 
		else { 
			PrintWriter script = response.getWriter(); 
			script.println("<script>"); 
			script.println("alert('신청 완료!')"); 
			script.println("location.href ='holidayf.jsp'"); 
			script.println("</script>"); 
		} 
	} 
	%>
</body>
</html>