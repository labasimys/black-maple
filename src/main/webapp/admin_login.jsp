<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<meta name="description" content="쇼핑몰">
	<meta name="keywords" content="HTML5, CSS, JQUERY">
	
    <title>Black Maple</title>
	
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="shortcut icon" href="images/icon.ico">
	<link rel="icon" href="images/icon.ico">
	<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>	
</head>
<body>
	<div class="login-page">
		<div class="login">
			<h3 style="text-align:center;">LOGIN</h3>
			<br>
			<form class="login-form" action="admin_loginAction.jsp">
				<input type="text" name="adID" placeholder="ID" maxlength="20">
				<input type="password" name="adPassword" placeholder="Password" maxlength="20">
				<button>login</button>
			</form>
		</div>
	</div>
</body>
</html>