<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>


<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
		request.setCharacterEncoding("euc-kr");
 		int EMPNO = Integer.parseInt(request.getParameter("EMPNO")); 
		String DNAME = request.getParameter("DNAME");
		String TITLE = request.getParameter("TITLE"); 
		String TEL = request.getParameter("TEL"); 	 
	
		String EMAIL = request.getParameter("EMAIL");
		int SALARY = Integer.parseInt(request.getParameter("SALARY"));
		String ADDRESS = request.getParameter("ADDRESS");
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		 
		Class.forName("com.mysql.cj.jdbc.Driver");
		 
		String jdbcDriver = "jdbc:mysql://127.0.0.1:3306/dbproject?characterEncoding=UTF-8&serverTimezone=UTC"; 
		String dbUser = "root";
		String dbPass = "1234";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		pstmt = conn.prepareStatement("UPDATE employee SET DNAME =?, TITLE=?, TEL=?, EMAIL=?, SALARY=?, ADDRESS=? WHERE EMPNO = ?");
		pstmt.setString(1, DNAME);//
		pstmt.setString(2, TITLE);
		pstmt.setString(3, TEL);
	
		pstmt.setString(4, EMAIL);
		pstmt.setInt(5, SALARY);
		pstmt.setString(6, ADDRESS);
		pstmt.setInt(7, EMPNO);
		out.println(pstmt + "<-- pstmt");
		 
		pstmt.executeUpdate();
		 
		PrintWriter script = response.getWriter(); 
		script.println("<script>"); 
 		script.println("alert('수정되었습니다.')"); 
 		script.println("location.href = 'staffm.jsp'"); 
 		script.println("</script>"); 
		
		
		pstmt.close();
		conn.close();
		 
%>

</body>
</html>