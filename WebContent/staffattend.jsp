<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="user.ManDAO"%>
<%@page import="user.DBUtil"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Locale"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>

<%@page session="true"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>



<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<script type="text/javascript">
	$(document).ready(
			function() {
				$.datepicker.setDefaults($.datepicker.regional['ko']);
				$("#startDate")
						.datepicker(
								{
									changeMonth : true,
									changeYear : true,
									nextText : '다음 달',
									prevText : '이전 달',
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dateFormat : "yy-mm-dd",
									maxDate : 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
									onClose : function(selectedDate) {
										//시작일(startDate) datepicker가 닫힐때
										//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
										$("#endDate").datepicker("option",
												"minDate", selectedDate);
									}

								});
				$("#endDate")
						.datepicker(
								{
									changeMonth : true,
									changeYear : true,
									nextText : '다음 달',
									prevText : '이전 달',
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dateFormat : "yymmdd",
									maxDate : 0, // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
									onClose : function(selectedDate) {
										// 종료일(endDate) datepicker가 닫힐때
										// 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
										$("#startDate").datepicker("option",
												"maxDate", selectedDate);
									}

								});
			});
</script>

<title>ABCD Team Project</title>
<!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="CodedThemes">
<meta name="keywords"
	content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="CodedThemes">
<!-- Favicon icon -->
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<!-- Google font-->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600"
	rel="stylesheet">
<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/css/bootstrap.min.css">
<!-- themify-icons line icon -->
<link rel="stylesheet" type="text/css"
	href="icon/themify-icons/themify-icons.css">
<!-- ico font -->
<link rel="stylesheet" type="text/css"
	href="icon/icofont/css/icofont.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css"
	href="css/jquery.mCustomScrollbar.css">

<style>
</style>

</head>

<body>


	<%
	String oTime = (String) session.getAttribute("startDate");
	System.out.println(oTime);
	
    String id = (String)session.getAttribute("MANID");
    String name="";
    String dname="";
    int dno;
    /*
    Connection conn = DBUtil.getMySQLConnection();
    String sql = "select * from manager where MANID = ?";
    
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    ResultSet rs = pstmt.executeQuery();
    rs.next();
    name = rs.getString("MANNAME");
    dname = rs.getString("DNAME");
    dno = rs.getInt("DNO");
*/

	//Connection con = DBUtil.getMySQLCOnnection();
	%>
	<!-- Pre-loader start -->
	<div class="theme-loader">
		<div class="ball-scale">
			<div class='contain'>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">

					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<nav class="navbar header-navbar pcoded-header">
				<div class="navbar-wrapper">

					<div class="navbar-logo">
						<a class="mobile-menu" id="mobile-collapse" href="#!"> <i
							class="ti-menu"></i>
						</a> <a class="mobile-search morphsearch-search" href="#"> <i
							class="ti-search"></i>
						</a> <a href="index1.html"> <img class="img-fluid abcd"
							src="assets/images/logo.png" alt="Theme-Logo" />
						</a> <a class="mobile-options"> <i class="ti-more"></i>
						</a>
					</div>

					<div class="navbar-container container-fluid">
						<ul class="nav-left">
							<li>
								<div class="sidebar_toggle">
									<a href="javascript:void(0)"><i class="ti-menu"></i></a>
								</div>
							</li>

							<li><a href="#!" onclick="javascript:toggleFullScreen()">
									<i class="ti-fullscreen"></i>
							</a></li>
						</ul>
						<ul class="nav-right">
							<li class="user-profile header-notification"><a href="#!">
									<span><%=name%></span> <i class="ti-angle-down"></i>
							</a>
								<ul class="show-notification profile-notification">
									<li><a href="index1.html"> <i class="ti-user"></i> My
											page
									</a></li>
									<li><a href="#"> <i class="ti-lock"></i> Lock Screen
									</a></li>
									<li><a href="logout2.jsp"> <i
											class="ti-layout-sidebar-left"></i> Logout
									</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</nav>
			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<nav class="pcoded-navbar">
						<div class="sidebar_toggle">
							<a href="#"><i class="icon-close icons"></i></a>
						</div>
						<div class="pcoded-inner-navbar main-menu">
							<div class="">
								<div class="main-menu-header">
									<div class="user-details">
										<span><%=name %></span> <span id="more-details"><%=dname%> 소속<i class="ti-angle-down"></i>
										</span>
									</div>
								</div>

								<div class="main-menu-content">
									<ul>
										<li class="more-details"><a href="index1.jsp"><i
												class="ti-user"></i>View my page</a> <a href="logout2.jsp"><i
												class="ti-layout-sidebar-left"></i>Logout</a></li>
									</ul>
								</div>
							</div>
							<div class="pcoded-navigatio-lavel"
								data-i18n="nav.category.navigation">Work</div>
							<ul class="pcoded-item pcoded-left-item">
								<li class=""><a href="index1.html"> <span
										class="pcoded-micon"><i class="ti-home"></i><b>D</b></span> <span
										class="pcoded-mtext" data-i18n="nav.dash.main">My page</span>
										<span class="pcoded-mcaret"></span>
								</a></li>
								<li class="active"><a href="staffattend.jsp"> <span
										class="pcoded-micon"><i
											class="icofont icofont icofont icofont-file-document bg-c-pink"></i></span>
										<span class="pcoded-mtext"
										data-i18n="nav.basic-components.main">Staff attendence</span>
										<span class="pcoded-mcaret"></span>
								</a></li>
								<li class=""><a href="staffm.jsp"> <span
										class="pcoded-micon"><i class="ti-layers"></i></span> <span
										class="pcoded-mtext" data-i18n="nav.basic-components.main">Staff
											management</span> <span class="pcoded-mcaret"></span>
								</a></li>
								<li class=""><a href="rholiday.jsp"> <span
										class="pcoded-micon"><i
											class="icofont icofont-table bg-c-yellow"></i></span> <span
										class="pcoded-mtext" data-i18n="nav.basic-components.main">Holiday
											request</span> <span class="pcoded-mcaret"></span>
								</a></li>
							</ul>

							<div class="pcoded-navigatio-lavel"
								data-i18n="nav.category.other">Other</div>
							<ul class="pcoded-item pcoded-left-item">
								<li class="pcoded-hasmenu "><a href="javascript:void(0)">
										<span class="pcoded-micon"><i class="ti-direction-alt"></i><b>M</b></span>
										<span class="pcoded-mtext" data-i18n="nav.menu-levels.main">ABCD</span>
										<span class="pcoded-mcaret"></span>
								</a>
									<ul class="pcoded-submenu">
										<li class=""><a href="location1.jsp"> <span
												class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
												class="pcoded-mtext"
												data-i18n="nav.menu-levels.menu-level-21">Location</span> <span
												class="pcoded-mcaret"></span>
										</a></li>
										<li class=""><a href="info1.jsp"> <span
												class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
												class="pcoded-mtext"
												data-i18n="nav.menu-levels.menu-level-23">Information
													on use</span> <span class="pcoded-mcaret"></span>
										</a></li>

									</ul></li>
							</ul>
						</div>
					</nav>

					<div class="pcoded-content">
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<div class="page-body">
										<div class="card">
											<div class="card-header">
												<h5>Staff attendence</h5>
												<div class="card-header-right">
													<ul class="list-unstyled card-option">
														<li><i class="icofont icofont-simple-left "></i></li>
														<li><i class="icofont icofont-maximize full-card"></i></li>
														<li><i class="icofont icofont-minus minimize-card"></i></li>
														<li><i class="icofont icofont-refresh reload-card"></i></li>
														<li><i class="icofont icofont-error close-card"></i></li>
													</ul>
												</div>
											</div>
											<div class="card-block table-border-style">
												<div class="form-group row m-l-10 m-r-20">
													<label class="col-sm-2 col-form-label">Date</label>
													<div class="col-sm-8">
														<form action="inquire.jsp" method="post">

															<input type="text" class="form-control" id="startDate"
																name="startDate" placeholder="Date" required>
													</div>
													<div class="col-sm-2">
														<button type="submit" class="btn btn-default">조회</button>
														</form>
													</div>

												</div>
												<div class="table-responsive">
													<table class="table table-hover">
														<%
															int ATTNO = 0;
														String EMPNAME = "null";
														String AD = "null";
														String AT = "null";
														%>

														<thead>
															<tr>
																<th><center>#</center></th>
																<th><center>Staff name</center></th>
																<th><center>Date</center></th>
																<th><Center>Attendence time</Center></th>
															</tr>
															<%
																//현재날짜

															SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
															Date currentTime = new Date();
															//oTime = mSimpleDateFormat.format(currentTime);

															String SQL = "SELECT EMPNAME, date_format(ATTEND_TIME, '%Y-%m-%d') as AD, date_format(ATTEND_TIME, '%H:%i:%s') as AT from attendence where date_format(ATTEND_TIME, '%Y-%m-%d') = ?";
															Connection con = DBUtil.getMySQLConnection();

															PreparedStatement pst = con.prepareStatement(SQL);
															pst.setString(1, oTime);
															ResultSet rs1 = pst.executeQuery();
															int i = 0;

															if (rs1.next()) {
																do {
																	i++;
																	EMPNAME = rs1.getString("EMPNAME");
																	AD = rs1.getString("AD");
																	AT = rs1.getString("AT");
															%>

															<tr>
																<td><center><%=i%></center></td>
																<td><center><%=EMPNAME%></center></td>
																<td><center><%=AD%></center></td>
																<td><center><%=AT%></center></td>

																<%
																	} while (rs1.next());
																}
																%>
															
														</thead>
													</table>
												</div>
											</div>
										</div>


										<!-- Hover table card end -->
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

		<!-- Warning Section Starts -->
		<!-- Older IE warning message -->
		<!--[if lt IE 9]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
		<!-- Warning Section Ends -->
		<!-- Required Jquery -->
		<script type="text/javascript" src="js/jquery/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui/jquery-ui.min.js"></script>
		<script type="text/javascript" src="js/popper.js/popper.min.js"></script>
		<script type="text/javascript" src="js/bootstrap/js/bootstrap.min.js"></script>
		<!-- jquery slimscroll js -->
		<script type="text/javascript"
			src="js/jquery-slimscroll/jquery.slimscroll.js"></script>
		<!-- modernizr js -->
		<script type="text/javascript" src="js/modernizr/modernizr.js"></script>
		<!-- am chart -->
		<script src="pages/widget/amchart/amcharts.min.js"></script>
		<script src="pages/widget/amchart/serial.min.js"></script>
		<!-- Todo js -->
		<script type="text/javascript " src="pages/todo/todo.js "></script>
		<!-- Custom js -->
		<script type="text/javascript"
			src="pages/dashboard/custom-dashboard.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
		<script type="text/javascript " src="js/SmoothScroll.js"></script>
		<script src="js/pcoded.min.js"></script>
		<script src="js/demo-12.js"></script>
		<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
</body>

</html>
