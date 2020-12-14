<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="user.UserDAO"%>
<%@page import="user.DBUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>ABCD Team Project</title>
    <!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
      <!-- Meta -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="description" content="CodedThemes">
      <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
      <meta name="author" content="CodedThemes">
      <!-- Favicon icon -->
      <link rel="icon" href="images/favicon.ico" type="image/x-icon">
      <!-- Google font-->
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet">
      <!-- Required Fremwork -->
      <link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.min.css">
      <!-- themify-icons line icon -->
      <link rel="stylesheet" type="text/css" href="icon/themify-icons/themify-icons.css">
      <!-- ico font -->
      <link rel="stylesheet" type="text/css" href="icon/icofont/css/icofont.css">
      <!-- Style.css -->
      <link rel="stylesheet" type="text/css" href="css/style.css">
      <link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.css">
      <style>

      </style>

  </head>

  <body>
  <%
 	String id = (String)session.getAttribute("EMPID");
  	int eno; 
 	String name;
 	//int dno;
 	String dname;
 	String title;
 	String tel;
 	String birthdate;
 	String email;
 	String sdate;
 	String address;
 	
 	Connection conn = DBUtil.getMySQLConnection();
 	String sql = "select * from employee where EMPID = ?";
 	
 	PreparedStatement pstmt = conn.prepareStatement(sql);
 	pstmt.setString(1, id);
 	ResultSet rs = pstmt.executeQuery();
 	rs.next();
 	eno = rs.getInt("EMPNO");
 	//dno = rs.getInt("DNO");
 	name = rs.getString("EMPNAME");
 	dname = rs.getString("DNAME");
 	title = rs.getString("TITLE");
 	tel = rs.getString("TEL");
 	birthdate = rs.getString("BIRTHDATE");
 	email = rs.getString("EMAIL");
 	sdate = rs.getString("SDATE");
 	address = rs.getString("ADDRESS");
 	
 	DBUtil.close(rs);
 	DBUtil.close(pstmt);
 	DBUtil.close(conn);
 
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
                        <a class="mobile-menu" id="mobile-collapse" href="#!">
                            <i class="ti-menu"></i>
                        </a>
                        <a class="mobile-search morphsearch-search" href="#">
                            <i class="ti-search"></i>
                        </a>
                        <a href="index.html">
                            <img class="img-fluid abcd" src="assets/images/logo.png" alt="Theme-Logo" />
                        </a>
                        <a class="mobile-options">
                            <i class="ti-more"></i>
                        </a>
                    </div>

                    <div class="navbar-container container-fluid">
                        <ul class="nav-left">
                            <li>
                                <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                            </li>

                            <li>
                                <a href="#!" onclick="javascript:toggleFullScreen()">
                                    <i class="ti-fullscreen"></i>
                                </a>
                            </li>
                        </ul>
                        <ul class="nav-right">
                            <li class="user-profile header-notification">
                                <a href="#!">
                                    <span><%=name %>님</span>
                                    <i class="ti-angle-down"></i>
                                </a>
                                <ul class="show-notification profile-notification">
                                    <li>
                                        <a href="index.jsp">
                                            <i class="ti-user"></i> My page
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="ti-lock"></i> Lock Screen
                                        </a>
                                    </li>
                                    <li>
                                        <a href="logout.jsp">
                                            <i class="ti-layout-sidebar-left"></i> Logout
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                    <nav class="pcoded-navbar">
                        <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                        <div class="pcoded-inner-navbar main-menu">
                            <div class="">
                                <div class="main-menu-header">
                                    <div class="user-details">
                                        <span><%=name %>님</span>
                                        <span id="more-details"><%=dname %><i class="ti-angle-down"></i></span>
                                    </div>
                                </div>

                                <div class="main-menu-content">
                                    <ul>
                                        <li class="more-details">
                                            <a href="index.jsp"><i class="ti-user"></i>View my page</a>
                                            <a href="logout.jsp"><i class="ti-layout-sidebar-left"></i>Logout</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">Work</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="">
                                    <a href="index.jsp">
                                        <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.dash.main">My page</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                <li class="">
                                    <a href="attendance.jsp">
                                        <span class="pcoded-micon"><i class="icofont icofont icofont icofont-file-document bg-c-pink"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">My attendence</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                <li class="">
                                    <a href="room.jsp">
                                        <span class="pcoded-micon"><i class="ti-layers"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Meeting room</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                <li class="pcoded-hasmenu ">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="icofont icofont-table bg-c-yellow"></i></span>
                                        <span class="pcoded-mtext" data-i18n="nav.menu-levels.main">My holiday</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class="active">
                                            <a href="holidayf.jsp">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">Request Form</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="holidayl.jsp">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">Request List</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                            </ul>

                            <div class="pcoded-navigatio-lavel" data-i18n="nav.category.other">Other</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="pcoded-hasmenu ">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="ti-direction-alt"></i><b>M</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.menu-levels.main">ABCD</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class="">
                                            <a href="location.jsp">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">Location</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="info.jsp">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">Information on use</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </nav>

                        <div class="pcoded-content">
                            <div class="pcoded-inner-content">
                              <!-- Main-body start -->
                                <div class="main-body">
                                    <div class="page-wrapper">

                                        <!-- Page body start -->
                                        <div class="page-body">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <!-- Basic Form Inputs card start -->
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h5>Request Form</h5>
                                                            <div class="card-header-right"><i
                                                                class="icofont icofont-spinner-alt-5"></i></div>

                                                                <div class="card-header-right">
                                                                    <i class="icofont icofont-spinner-alt-5"></i>
                                                                </div>

                                                            </div>
                                                            <div class="card-block">
                                                                <h4 class="sub-title">Input details</h4>
                                                                <form class="from-input form-request" id="holiday" action="holidayAction.jsp" method="post">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-2 col-form-label">Name</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" class="form-control" name="EMPNAME"
                                                                            placeholder=<%=name %> readonly>
                                                                        </div>
                                                                        <div>
                                                                        	<input type="hidden" class="form-control" value="<%=eno %>" name="EMPNO"
                                                                            readonly>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-2 col-form-label">Department</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" class="form-control" name="DNAME" value="<%=dname %>"
                                                                            placeholder="<%=dname %>" readonly><!--disabled 속성 고려-->
                                                                        </div>
                                                                         <div>
                                                                        	<input type="hidden" class="form-control" value= name="DNO"
                                                                            readonly>
                                                                        </div>
                                                                    </div>
                                                                        <div class="form-group row">
                                                                            <label class="col-sm-2 col-form-label">Type</label>
                                                                            <div class="col-sm-10">
                                                                                <select name="HTYPE" class="form-control">
                                                                                    <option value="morning_off">반차(오전)</option>
                                                                                    <option value="afternoon_off">반차(오후)</option>
                                                                                    <option value="annual_leave">연차</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                            <label class="col-sm-2 col-form-label">Date</label>
                                                                            <div class="col-sm-10">
                                                                                <input type="date" class="form-control" name="START_TIME" placeholder="Starting Date" required>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                            <label class="col-sm-2 col-form-label">Date</label>
                                                                            <div class="col-sm-10">
                                                                                <input type="date" class="form-control" name="END_TIME"
                                                                                placeholder="End date" required><!--disabled 속성 고려-->
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                        	<button class="btn btn-primary" type="submit">신청</button>                                                                           
                                                                        </div>
                                                                    </form>
                                                              </div>
                                                          </div>
                                                                                    
                                                           </div>
                                                       </div>
                                                  </div>
                                              </div>
                                                                    <!-- Basic Form Inputs card end -->
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
<script type="text/javascript" src="js/jquery-slimscroll/jquery.slimscroll.js"></script>
<!-- modernizr js -->
<script type="text/javascript" src="js/modernizr/modernizr.js"></script>
<!-- am chart -->
<script src="pages/widget/amchart/amcharts.min.js"></script>
<script src="pages/widget/amchart/serial.min.js"></script>
<!-- Todo js -->
<script type="text/javascript " src="pages/todo/todo.js "></script>
<!-- Custom js -->
<script type="text/javascript" src="pages/dashboard/custom-dashboard.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript " src="js/SmoothScroll.js"></script>
<script src="js/pcoded.min.js"></script>
<script src="js/demo-12.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>

</body>

</html>
