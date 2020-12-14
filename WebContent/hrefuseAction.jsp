<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.HolidayDAO" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*" %> 
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <%
 
	 	Connection conn;
	    Statement stmt;
	    ResultSet rs;
	 	
	    String dbURL = "jdbc:mysql://127.0.0.1:3306/dbproject?characterEncoding=UTF-8&serverTimezone=UTC"; 
	    String dbID = "root";
	    String dbPassword = "1234"; 
	    Class.forName("com.mysql.cj.jdbc.Driver"); 
	    conn = DriverManager.getConnection(dbURL, dbID, dbPassword); 
	   
	 	
	 	int REQNO = Integer.parseInt(request.getParameter("REQNO")); 
	 	
	 	PreparedStatement pst= conn.prepareStatement("UPDATE hrequest SET STATUS = 'Refuse' WHERE REQNO = ?");
		pst.setInt(1,REQNO);
		pst.executeUpdate();
		
		PrintWriter script = response.getWriter(); 

		
		
		script.println("<script>"); 
 		script.println("alert('반려되었습니다')"); 
 		script.println("location.href = 'rholiday.jsp'"); 
 		script.println("</script>"); 
			
 %>
</body>
</html>