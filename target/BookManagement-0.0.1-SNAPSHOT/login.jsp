<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Product Management System</title>
<%@include file="common.jsp"%>
<style type="text/css">
#login, #register, #forget {
	
	font-weight: bold;
	padding: 10px
}
form{
width:50%;

border: 2px solid black;
}

.log, .reg, .forget {
	
	padding: 10px;
	border-color:black;
}

#submit {
	
}

#submit input[type="submit"] {
	border-style: solid;
	border-color: black;
	outline: none;
	height: 25px;
	width: 80px;
	color: black;
	font-size: 13px;
	font-style: serif;
	margin-left: auto;
	margin-right: 0;
}

#submit input[type="submit"]:hover {
	cursor: pointer;
	background: white;
	color: #000;
}

#forgot {
	margin-left: 30%
}

.inputs {
	padding: 5px;
	margin: 5px;
	margin-left: 20%;
	
}
span{
background-color: #e6e6e6;
}

.btn-forget {
	display: flex;
	justify-content: flex-start;
	align-items: center;
}

.btn-forget>.btn {
	margin-right: 10px;
}
main {
  display: flex;
  justify-content: center;
  /* align-items: center; */
  
}
header,footer{
background-color:#33bbff;
border-color:yellow;
display: flex;
  justify-content: center;
}
b{
font-size:30px;
}
</style>
</head>
<body>
	<header>
	<b>Library Login Page</b>
	</header>
	

	<main>
	<!-- <div id="login">Login</div> -->

	<form action="login" method="post">

		<div class="log">
			<span>Enter Username : </span>
			 <input type="text" name="uname"
				onkeypress="return isNumberKey(event)" minlength="5" maxlength="50"
				class="inputs"><br> <span>Enter Password : </span> 
				<input
				type="password" name="pass" onkeypress="return isNumberKey(event)"
				minlength="5" maxlength="50" class="inputs"> <br> <br>
			<%
			if (request.getAttribute("message") != null) {
			%>
			<h5><%=request.getAttribute("message")%></h5>
			<%
			}
			%>

			<a id="register" href="register.jsp">New user? Register here. </a><br>
		</div>
		<div id="submit">
			<div>
				<input type="submit" value="Login">
			</div>
		</div>
	</form>
	</main>
	

	
</body>

</html>