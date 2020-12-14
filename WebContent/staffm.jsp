<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="user.ManDAO"%>
<%@page import="user.UserDAO"%>
<%@page import="user.DBUtil"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
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
       /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
      </style>

  </head>

  <body>
  
    <%
    String id = (String)session.getAttribute("MANID");
    String name;
    String dname;

    
    Connection conn = DBUtil.getMySQLConnection();
    String sql = "select * from manager where MANID = ?";
    
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    ResultSet rs = pstmt.executeQuery();
    rs.next();
    name = rs.getString("MANNAME");
    dname = rs.getString("DNAME");

    
    int pageNumber = 1;
    
    if(request.getParameter("pageNumber")!=null){
       pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
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
                                    <span><%=name%>님</span>
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
                                        <span id="more-details"><%=dname%> 소속<i class="ti-angle-down"></i></span>
                                    </div>
                                </div>

                                <div class="main-menu-content">
                                    <ul>
                                        <li class="more-details">
                                            <a href="index1.jsp"><i class="ti-user"></i>View my page</a>
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
                                <li class="active">
                                    <a href="staffm.jsp">
                                        <span class="pcoded-micon"><i class="ti-layers"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Staff management</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                <li class="">
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


                    <!--직원 관리 수정 삭제 작업-->
                    <div class="pcoded-content">
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <div class="page-body">
                                      <div class="card">
                                                        <div class="card-header">
                                                            <h4>Staff management</h4>
                                                            <div class="card-header-right"><i
                                                                class="icofont icofont-spinner-alt-5"></i></div>

                                                                <div class="card-header-right">
                                                                    <i class="icofont icofont-spinner-alt-5"></i>
                                                                </div>

                                                            </div>
                                                            <div class="card-block">
                                                                <h5 class="sub-title">My Staff</h5>
                                                                
                                                                
                                                       <table class="table table-bordered" width="600" border="1">
      
                                                    <% 
                                                        int EMPNO = 0;
                                                        String EMPNAME = "없습니다.";
                                                        String EMPID = "없습니다.";
                                                        String DNAME = "없습니다.";
                                                        String TITLE ="없습니다.";
                                                        String TEL ="없습니다.";
                                                        String BIRTHDATE = "없습니다.";
                                                        String EMAIL = "없습니다.";
                                                        int SALARY = 0;
                                                        String SDATE = "없습니다.";
                                                        String ADDRESS = "없습니다.";
                            
                                                     %>
      
                                                           </br></br>
                                                            <th class='tb'><center>#</center></th>
                                                            <th class='tb'><center>Name</center></th>
                                                            <th class='tb'><center>ID</center></th>
                                                               <th class='tb'><center>Department</center></th>
                                                               <th class='tb'><center>Title</center></th>
                                                               <th class='tb'><center>Tel</center></th>
                                                               
                                                               
                                                               <th class='tb'><center>Email</center></th>
                                                               <th class='tb'><center>Salary</center></th>
                                                               <th class='tb'><center>Starting-Date</center></th>
                                                               <th class='tb'><center>Address</center></th>
                                                               <th class='tb' colspan = "2"><center>Option</center></th>
                                                               
                                                               <%String sql1 = "select EMPNO, EMPNAME, EMPID, DNAME, TITLE, TEL, date_format(BIRTHDATE, '%Y-%m-%d') AS BDATE, EMAIL, SALARY, date_format(SDATE, '%Y-%m-%d') AS DATE, ADDRESS from employee where DNAME = ?";//dname 
                                                               
                                                                  PreparedStatement pstmt1 = conn.prepareStatement(sql1);
                                                               pstmt1.setString(1, dname);//dname
                                                               ResultSet rs1 = pstmt1.executeQuery();

                                                            if(rs1.next()){
                                                               do{
                                                                     EMPNO = rs1.getInt("EMPNO");
                                                                     EMPNAME = rs1.getString("EMPNAME");
                                                                     EMPID = rs1.getString("EMPID");
                                                                     DNAME = rs1.getString("DNAME");
                                                                     TITLE = rs1.getString("TITLE");
                                                                     TEL = rs1.getString("TEL");
                                                                    
                                                                     EMAIL = rs1.getString("EMAIL");
                                                                     SALARY = rs1.getInt("SALARY");
                                                                     SDATE = rs1.getString("DATE");
                                                                     ADDRESS = rs1.getString("ADDRESS");
                                                                  
                                                                  %>
                                                               <tr>
                                                               <td class='tb'><center><%=EMPNO%></center></td>
                                                                  <td class='tb'><center><%=EMPNAME%></center></td>
                                                                  <td class='tb'><center><%=EMPID%></center></td>
                                                                  <td class='tb'><center><%=DNAME%></center></td>
                                                                  <td class='tb'><center><%=TITLE%></center></td>
                                                                  <td class='tb'><center><%=TEL%></center></td>
                                                                  
                                                                  <td class='tb'><center><%=EMAIL%></center></td>
                                                                  <td class='tb'><center><%=SALARY%></center></td>
                                                                  <td class='tb'><center><%=SDATE%></center></td>
                                                                  <td class='tb'><center><%=ADDRESS%></center></td>
                                                                  <td class='tb'><button class="btn btn-primary" id="myBtn">Update</button></td>
                                                                  <td class='tb'><form action="removeStaffAction.jsp"><button class="btn btn-primary" value="<%=EMPNO%>"  name="EMPNO" type="submit">Delete</button></form></td>
																</tr>
                                                               <%
                                                                }while(rs1.next());
                                                            }
                                                         
                                                        %>
                                                               
                                                               
                                                        
                                                       
                                                        </table>
              
                                                               </div>
                                                            </div>
                                      
						                                </div>
						                            </div>
						                        </div>
						                    </div>
						                  </div>
						                 </div>
						                </div>
						               </div>
						             </div>
						            
            
            <div id ="myModal" class="modal">
            <div class="modal-content">
            <span class="close">&times;</span>
            <!--폼시작-->
            <div class="row">
                                                <div class="col-sm-12">
                                                    <!-- Basic Form Inputs card start -->
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h3>Update details</h3>
                                                            <div class="card-header-right"><i
                                                                class="icofont icofont-spinner-alt-5"></i></div>

                                                                <div class="card-header-right">
                                                                    <i class="icofont icofont-spinner-alt-5"></i>
                                                                </div>

                                                            </div>
                                                            <div class="card-block">
                                                                <form action="updateStaffAction.jsp" method="post">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-2 col-form-label">Name</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" class="form-control" name="name" value="<%=EMPNAME%>" readonly>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-2 col-form-label">ID</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" class="form-control" name="id" value="<%=EMPID%>" readonly>
                                                                        </div>
                                                                    </div>
                                                                        <div class="form-group row">
                                                                        <label class="col-sm-2 col-form-label">Department</label>
                                                                        <div class="col-sm-10">
                                                                            <select name="DNAME">
															                  <option value=""><%=DNAME%></option>
															                  <option value="human_resource">인사부</option>
															                  <option value="accounting">회계부</option>
															                  <option value="marketing">마케팅</option>
															                  <option value="management">경영부</option>
															                  <option value="computer">전산부</option>
															                  <option value="sales">영업부</option>
															                  <option value="purchase">구매부</option>
															               </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-2 col-form-label">Title</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" class="form-control" name="TITLE" value="<%=TITLE%>">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-2 col-form-label">TEL</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" class="form-control" name="TEL" value="<%=TEL%>">
                                                                        </div>
                                                                    </div>
                                                                  
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-2 col-form-label">Email</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" class="form-control" name="EMAIL" value="<%=EMAIL%>">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-2 col-form-label">Salary</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" class="form-control" name="SALARY" value="<%=SALARY%>">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-2 col-form-label">Starting-Date</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" class="form-control" name="sdate" value="<%=SDATE%>" readonly>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-2 col-form-label">Address</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" class="form-control" name="ADDRESS" value="<%=ADDRESS%>">
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <center>
                                                                    	<button class="btn btn-primary" value="<%=EMPNO%>" name="EMPNO" type="submit">Update</button>
                                                                    </center>
                                                                    </form>
                                                                    
                                                                    
                                                                    
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

<!--<script src="https://code.jquery.com/jquery-1.11.3.js" integrity="sha256-IGWuzKD7mwVnNY01LtXxq3L84Tm/RJtNCYVfXZw3Je0=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
-->

</body>

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];                                          

// When the user clicks on the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

</script>



</html>
l>