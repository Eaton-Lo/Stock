<%@page import="java.util.List,java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href = "../css/jquery-ui.css"/>
<link type="text/css" rel="stylesheet" href = "../css/public.css"/>

<script type="text/javascript" src = "../js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src = "../js/jquery-ui.js"></script>
<script type="text/javascript" src = "../js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="../css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="../css/dataTables.tableTools.css">
<script type="text/javascript" language="javascript" src="../js/jquery.dataTables.js"></script>

<script type="text/javascript" language="javascript" src="../js/dataTables.tableTools.js"></script>

<link type="text/css" rel="stylesheet" href="../css/font-awesome.min.css">

<script type="text/javascript" src = "../js/public.js"></script>
<script type="text/javascript" src="../js/datepicker.js"></script>
<title></title>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
	width: 360px;
	padding: 8% 0 0;
	margin: auto;
}

.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

.form input {
	font-family: "Roboto", sans-serif;
	outline: 0;
	background: #f2f2f2;
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
}

.form button {
	font-family: "Roboto", sans-serif;
	text-transform: uppercase;
	outline: 0;
	background: #4CAF50;
	width: 100%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.form button:hover, .form button:active, .form button:focus {
	background: #43A047;
}

.form .message {
	margin: 15px 0 0;
	color: #b3b3b3;
	font-size: 12px;
}

.form .message a {
	color: #4CAF50;
	text-decoration: none;
}

.form .register-form {
	display: none;
}

.container {
	position: relative;
	z-index: 1;
	max-width: 300px;
	margin: 0 auto;
}

.container:before, .container:after {
	content: "";
	display: block;
	clear: both;
}

.container .info {
	margin: 50px auto;
	text-align: center;
}

.container .info h1 {
	margin: 0 0 15px;
	padding: 0;
	font-size: 36px;
	font-weight: 300;
	color: #1a1a1a;
}

.container .info span {
	color: #4d4d4d;
	font-size: 12px;
}

.container .info span a {
	color: #000000;
	text-decoration: none;
}

.container .info span .fa {
	color: #EF3B3A;
}

body {
	background: #76b852; /* fallback for old browsers */
	background: -webkit-linear-gradient(right, #252830, #8DC26F);
	background: -moz-linear-gradient(right, #252830, #8DC26F);
	background: -o-linear-gradient(right, #252830, #8DC26F);
	background: linear-gradient(to left, #252830, #8DC26F);
	font-family: "Roboto", sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}
</style>

</head>
<body>
	<div class="login-page">
		<div class="form">
			<form class="register-form">
				<input type="text" id="create_firstName" placeholder="First name" /> <input type="text"
					placeholder="Last name" id="create_lastName"  /> <input type="password"
					placeholder="Password"  id="create_password"  /> <input type="email"
					placeholder="Email address"  id="create_email"  />
				<div class="btn btn-default" id="createBtn">Create</div>
				<p class="message">
					Already registered? <a href="#">Sign In</a>
				</p>
			</form>
			<form class="login-form">
				<input type="text" placeholder="email" id="login_email" /> <input type="password"
					placeholder="password" id="login_password"/>
				<div class="btn btn-default" id="loginBtn">Login</div>
				<p class="message">
					Not registered? <a href="#">Create an account</a>
				</p>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript" src="../js/login.js"></script>
</html>
