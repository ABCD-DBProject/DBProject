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

		.container-login{
			margin-top: 150px;
			align:center;
			background-color:rgb(255, 255, 255, 0.2);
			margin-left:850px
		}

		.title-bar{
			margin-top:50px;
			margin-bottom:50px;
			font-size:30pt;
			align:center;
		}

		.form-logo{
			margin-left:100px;
		}

		.gender {
  		font-size: 15pt;
  		font-weight: bold;
		}

		.male {
  		margin-left: 5px;
		}

		.female {
  		margin-left: 5px;
		}

		.form-control{
			height:auto;;
			font-size:16px;
			margin:10px 0;
		}

		.register{
			margin-left:800px;
		}

		.register1{
			margin-left:700px;
		}

		.btn-control1{
			margin-top:10px;
			align:center;
			margin-bottom:5px;
			margin-left:125px;
		}

		.text-muted1{
			margin-left:70px;
		}
		.dlabel{
			font-size: 13pt;
		}
		.select{
			margin-top:50px;
			margin-left:10px;
		}
		.sdate{
			font-size: 13pt;
			margin-top:30px;
		}
  </style>

</head>

<body>
		<div class="container-login">
			<img class="form-logo" src="img/logo.png" alt="Companylogo.png" width="100" height="50">
			<h1 class="h3 mb-3 font-weight-normal title-bar">Create Account</h1>
		</div>
		<div class="container register1">
			<form class="form-register" method="post" action="joinAction.jsp">
				<div class="col-xs-8 col-sm-4">
        			<label for="name" class="sr-only">Name</label>
        			<input type="text" class="form-control" name="EMPNAME" placeholder="Name" required>

        			<label for="id" class="sr-only">ID</label>
        			<input type="text" class="form-control" name="EMPID" placeholder="ID" required>

					<label for="password" class="sr-only">Password</label>
					<input type="password" class="form-control" name="EMPPW" placeholder="Password" required>

        			<label for="email" class="sr-only">Email Address</label>
        			<input type="email" class="form-control" name="EMAIL" placeholder="Email: user@software.com" required>

        			<label for="phone" class="sr-only">Phone</label>
        			<input type="tel" class="form-control" name="TEL" placeholder="Phone Number" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>

        			<label for="birth" class="sr-only">Birth Date</label>
        			<input type="date" class="input" placeholder="birthdate" name="BIRTHDATE">
				</div>
				<div class="col-xs-8 col-sm-4 select">
					<p class="dlabel">Department</p>
					<select name="DNAME">
						<option value="">부서선택</option>
						<option value="human_resource">인사부</option>
						<option value="accounting">회계부</option>
						<option value="marketing">마케팅</option>
						<option value="management">경영부</option>
						<option value="computer">전산부</option>
						<option value="sales">영업부</option>
						<option value="purchase">구매부</option>
					</select>
					<p class="sdate">Starting Date</p>
					<input type="date" placeholder="sdate" name="SDATE">
				</div>
				<div class="container register">
			<button class="btn btn-lg btn-primary btn-control1" type="submit">Sign up</button>
			<p class="text-muted1">Are you already a member? <a href="login.jsp">Login</a></p>
		</div>
		</form>
		</div>		
		<script>
		document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
		</script>
	</body>
</html>