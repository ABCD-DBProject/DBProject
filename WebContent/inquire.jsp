<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="chulcheck.MyUtilDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Locale"%>
<%@page session = "true" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
	String startDate = request.getParameter("startDate");
	
    System.out.println(startDate);
	session.setAttribute("startDate", startDate);
	
	
	PrintWriter script = response.getWriter(); 
	script.println("<script>"); 
	script.println("location.href = 'staffattend.jsp'");
	script.println("</script>"); 
	%>