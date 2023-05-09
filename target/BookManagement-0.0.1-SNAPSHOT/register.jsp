<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Product Management System</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/login.css">
</head>
<body >


<div id="register">Register</div>

<form action="register" method="post" >
			<%
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			if (request.getAttribute("message") != null) {
			%>
			<label><%=request.getAttribute("message")%></label>
			<%
			}
			%>
<div class="reg">
<span>Enter Username : </span><input type="text" name="newUname" class="inputs"><br>
<span>Enter Password : </span><input type="password" name="newPass" class="inputs"><br>
<span>Confirm Password: </span>
<input type="password" name="conPass" class="inputs"><br>
<br>
<a id="register" href="login.jsp">Already registered? Login here.. </a><br>
</div>
<div id="submit" style="display: flex; justify-content: flex-end">
  <div ><input type="submit" value="Register"></div>
</div>
</form>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>

</body>

</html>