<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="user.UserDAO" %> 
<%@ page import="java.io.PrintWriter" %>
 <% request.setCharacterEncoding("UTF-8"); %> 
 
<%@ page import="user.ManDAO" %> 
<%@ page import="java.io.PrintWriter" %> 


<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*" %> 
 
 
 
 
 <!DOCTYPE html> 
 <html lang="ko"> 
 	<head> 
 	<meta charset="UTF-8"> 
 	<title>delete staff</title> 
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
	   
	 	
	 	int EMPNO = Integer.parseInt(request.getParameter("EMPNO")); 
	 	String EMPID = (String)session.getAttribute("EMPID");
	 	
	 	
	 	PreparedStatement pst= conn.prepareStatement("DELETE FROM employee where EMPNO =? ");
		pst.setInt(1,EMPNO);
		pst.executeUpdate();
		
		PrintWriter script = response.getWriter(); 

		
		
		script.println("<script>"); 
 		script.println("alert('삭제되었습니다.')"); 
 		script.println("location.href = 'staffm.jsp'"); 
 		script.println("</script>"); 
			
 %>
 	
 	
 
	
	
	
	
	
    
	
 
 	
 	</body> 
 	</html>