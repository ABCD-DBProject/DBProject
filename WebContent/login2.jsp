<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="user.ManDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
	<title>Company Service Login</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- CSS -->
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/index.css">
	<link href='https://fonts.googleapis.com/css?family=Capriola' rel='stylesheet'>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


	<style>
		body {
		background-image: url('/img/index_background_img.jpg');
		height: auto;
		}

		.title-bar{
			margin-top:100px;
			margin-bottom:50px;
			font-size:30pt;
		}

		.company-name{
		  display:inline;
			font-size:35pt;
		}

		.form-logo{
			display:inline;
		}

		.container-login{
			margin-top: 150px;
		  align-self:center;
			margin-left:400px;
			margin-right:400px;
			background-color:rgb(255, 255, 255, 0.2);
		}

		.login-tab{
			align-self:center;
		}

		.form-control{
			width:250px;
			margin-bottom: 10px;
		}

		.form-sl{
			width:300px;
		}

		.btn-control{
			margin-top:10px;
			align:center;
			margin-bottom:5px;
		}

		.nav-tabs{
			margin-bottom:10px;
		}

	</style>
</head>

<body class="text-center">
	<!--본래 index.html은 main.html에서 확인할 수 있습니다-->
	<!--main.html은 로그인을 제외한 기존 기능들을 모두 제공합니다-->
	<!--http://localhost:5001 에서 [f12]키를 누르고 Application-Cookies 메뉴에서 로그인 정보가 생기는 것을 확인하세요-->

	<!-- 로그인 폼 -->
	<div class="container-login">
			<img class="form-logo" src="img/logo.png" alt="Companylogo.png" width="100" height="50"><h1 class="company-name">Company name</h1>
			<h1 class="h3 mb-3 font-weight-normal title-bar">Manager Login</h1>
			<div class="form-sl container">
			<ul class="nav nav-tabs">
    		<li><a data-toggle="tab" href="/login">Staff Login</a></li>
    		<li class="active"><a data-toggle="tab" href="/login2">Manager Login</a></li>
			</ul>

				<!-- sr-only : bootstrap의 class: 해당 라벨을 숨김 -->
			<div class="tab-content login-tab">
				<div id="menu1" class="tap-pane fade in active">
					<div class="container">
						<form class="from-input form-login" id="formLogin" action="login2Action.jsp" method="post">
							<label for="email" class="sr-only">ID</label>
							<input type="text" class="form-control" name="MANID" placeholder="ID" required>

							<label for="password" class="sr-only">Password</label>
							<input type="password" class="form-control" name="MANPW" placeholder="Password" required>

							<button class="btn btn-lg btn-primary btn-control" type="submit">Sign in</button>
						</form>
					</div>		
					</div>
				</div>
			</div>
			</div>
</body>

</html>
