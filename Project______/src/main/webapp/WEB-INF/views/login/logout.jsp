<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

.container {
	width: 80%;
	margin: auto;
	overflow: hidden;
}

header {
	background: #333;
	color: #fff;
	padding-top: 30px;
	min-height: 70px;
	border-bottom: #e8491d 3px solid;
}

.login-form {
	width: 300px;
	margin: 5% auto;
	margin-top: 30px;
	background: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.login-form input[type="text"], .login-form input[type="password"] {
	width: 278px;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.login-form input[type="submit"] {
	width: 300px;
	padding: 10px;
	margin-bottom: 15px;
	border-radius: 5px;
	background: #333;
	color: #fff;
	border: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<header>
		<div class="container">
			<h1>Welcome to HR Management System</h1>
		</div>
	</header>
	<div class="container">
		<div class="login-form">
			<h2>Login</h2>
			<form:form action="/login/loginProcess" method="get" modelAttribute="login">
				<form:errors element="div"/>
				<label for="userid">ID : </label><input name="userid" id="userid" type="text"><form:errors path="userid" delimiter=" "/> <br>
				<label for="Password">Password : </label><input name="Password" id="Password" type="Password"><form:errors path="Password" delimiter=" "/><br>
				<input type="submit" value="로그인">
					
			</form:form>
		</div>
	</div>
</body>
</html>