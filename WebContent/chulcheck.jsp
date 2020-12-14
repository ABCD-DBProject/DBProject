<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="chulcheck.MyUtilDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Locale"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
	Date checkDate; //DB에 저장되어있는 날짜
	Date currentDate; //현재날짜 Date
	String oTime = ""; //현재날짜
	String chulcheck = "";

	String id = "";
	id = (String) session.getAttribute("EMPID");

	MyUtilDAO myutilDAO = new MyUtilDAO();

	System.out.println(id);
	myutilDAO = myutilDAO.getEMP(id);
	int i = 0;
	i = myutilDAO.Attend(id);

	System.out.println(i);

	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
	Date currentTime = new Date();
	oTime = mSimpleDateFormat.format(currentTime); //현재시간 (String)

	int result1 = myutilDAO.check(i, oTime);
	if (result1 == 1) {
		System.out.println("같은날");
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 오늘 출석했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (result1 == -1) {
		int result = myutilDAO.save(myutilDAO);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('서버오류')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('출석 완료')");
			script.println("location.href = 'attendance.jsp'");
			script.println("</script>");
		}
	}
	%>

</body>
</html>