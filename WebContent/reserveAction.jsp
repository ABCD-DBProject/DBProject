<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.RoomDAO" %>
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
	String EMPID = (String)session.getAttribute("EMPID");
	int ROOMNO = Integer.parseInt(request.getParameter("ROOMNO")); 
	String RDATE = request.getParameter("RDATE"); 
	String RTIME = request.getParameter("RTIME");
	
	System.out.println(RDATE);
	
	/*if(EMPID == null || ROOMNO == 0 || RDATE == null || RTIME == null) { 
		PrintWriter script = response.getWriter(); 
		script.println("<script>"); 
		script.println("alert('빈칸을 확인해 주세요')"); 
		script.println("history.back()"); 
		script.println("</script>"); 
	} 
	else { */
		RoomDAO roomDAO = new RoomDAO(); 
		roomDAO.setEMPID(EMPID);
		roomDAO.setROOMNO(ROOMNO); 
		roomDAO.setRDATE(RDATE); 
		roomDAO.setRTIME(RTIME); 
		
		System.out.println(roomDAO.getRDATE());
		
		int result = roomDAO.reserve(roomDAO);
		
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
			script.println("alert('이미 예약된 회의실입니다.')"); 
			script.println("history.back()"); 
			script.println("</script>"); 
		}
		else if(result == -2) { 
			PrintWriter script = response.getWriter(); 
			script.println("<script>"); 
			script.println("alert('해당 시간에 예약 내역이 존재합니다.')"); 
			script.println("history.back()"); 
			script.println("</script>"); 
		} 
		else if(result == 2) { 
			PrintWriter script = response.getWriter(); 
			script.println("<script>"); 
			script.println("alert('해당 날짜의 예약 내역이 마감되었습니다.')"); 
			script.println("history.back()"); 
			script.println("</script>"); 
		}
		else { 
			PrintWriter script = response.getWriter(); 
			script.println("<script>"); 
			script.println("alert('예약되었습니다.')"); 
			script.println("location.href ='room.jsp'"); 
			script.println("</script>"); 
		}
	//}
	%>

</body>
</html>