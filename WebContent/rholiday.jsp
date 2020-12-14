<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="user.ManDAO"%>
<%@page import="user.DBUtil"%>
<%@page import="user.HolidayDAO" %>
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
 	String id = (String)session.getAttribute("MANID"); 
 	String name;
 	//int dno;
 	String dname;
 	
 	String ename;
 	String htype;
 	String s_time;
 	String status;
 	int eno;
 	int REQNO;
 	
 	Connection conn = DBUtil.getMySQLConnection();
 	String sql = "select * from manager where MANID = ?";
 	
 	PreparedStatement pstmt = conn.prepareStatement(sql);
 	pstmt.setString(1, id);
 	ResultSet rs = pstmt.executeQuery();
 	rs.next();
 	
 	name = rs.getString("MANNAME");
 	dname = rs.getString("DNAME");
 	//dno = rs.getInt("DNO");
 	
 	String sql1 = "select REQNO, EMPNO, HTYPE, date_format(START_TIME, '%Y-%m-%d') AS DATE, STATUS from hrequest where DNAME = ?";
 	
 	PreparedStatement pstmt1 = conn.prepareStatement(sql1);
 	pstmt1.setString(1, dname);
 	ResultSet rs1 = pstmt1.executeQuery();
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
                        <a href="index1.jsp">
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
                                        <a href="index1.jsp">
                                            <i class="ti-user"></i> My page
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="ti-lock"></i> Lock Screen
                                        </a>
                                    </li>
                                    <li>
                                        <a href="logout2.jsp">
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
                                        <span><%=name%>님</span>
                                        <span id="more-details"><%=dname %><i class="ti-angle-down"></i></span>
                                    </div>
                                </div>

                                <div class="main-menu-content">
                                    <ul>
                                        <li class="more-details">
                                            <a href="index1.html"><i class="ti-user"></i>View my page</a>
                                            <a href="logout2.jsp"><i class="ti-layout-sidebar-left"></i>Logout</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">Work</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="">
                                    <a href="index1.jsp">
                                        <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.dash.main">My page</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                <li class="">
                                    <a href="staffattend.jsp">
                                        <span class="pcoded-micon"><i class="icofont icofont icofont icofont-file-document bg-c-pink"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Staff attendence</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                <li class="">
                                    <a href="staffm.jsp">
                                        <span class="pcoded-micon"><i class="ti-layers"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Staff management</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                <li class="active">
                                    <a href="rholiday.jsp">
                                        <span class="pcoded-micon"><i class="icofont icofont-table bg-c-yellow"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Holiday request</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
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
                                            <a href="location1.jsp">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">Location</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="info1.jsp">
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



                    <!--휴가 요청 수락 , 거부인지 저장?-->
                    <div class="pcoded-content">
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <div class="page-body">
                                      <div class="card">
                                          <div class="card-header">
                                              <h5>Request List</h5>
                                              <div class="card-header-right">    <ul class="list-unstyled card-option">        <li><i class="icofont icofont-simple-left "></i></li>        <li><i class="icofont icofont-maximize full-card"></i></li>        <li><i class="icofont icofont-minus minimize-card"></i></li>        <li><i class="icofont icofont-refresh reload-card"></i></li>        <li><i class="icofont icofont-error close-card"></i></li>    </ul></div>
                                          </div>
                                          <div class="card-block table-border-style">
                                              <div class="table-responsive">
                                                  <table class="table table-hover">
                                                      <thead>
                                                          <tr>
                                                              <th>Staff No</th>
                                                              <th>Type</th>
                                                              <th>Date</th>
                                                              <th>Status</th>
                                                              <th class='tb' colspan = "2"><center>Option</center></th>
                                                          </tr>
                                                      </thead>
                                                      <tbody>
                                                          <%while(rs1.next()) {                                                     	  
                                                    	  eno = rs1.getInt("EMPNO");
                                                    	  htype = rs1.getString("HTYPE");
                                                    	  s_time = rs1.getString("DATE");
                                                    	  status = rs1.getString("STATUS");   
                                                    	  REQNO = rs1.getInt("REQNO");
                                                          %>
                                                          <tr>
                                                              <th scope="row"><%=eno%></th>
                                                              <td><%=htype %></td>
                                                              <td><%=s_time%></td>
                                                              <td><%=status%></td>
                                                              <td class='tb'><form action="haccessAction.jsp"><button class="btn btn-primary" value="<%=REQNO%>"  name="REQNO" type="submit">승인</button></form></td>
                                                              <td class='tb'><form action="hrefuseAction.jsp"><button class="btn btn-primary" value="<%=REQNO%>"  name="REQNO" type="submit">반려</button></form></td>
                                                          </tr>
                                                         <% }//end while%> 
                                                      </tbody>
                                                      <%rs.close();
                                                      	pstmt.close();
                                                      	rs1.close();
                                                      	pstmt1.close();
                                                      	conn.close();
                                                      	%>
                                                  </table>
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
