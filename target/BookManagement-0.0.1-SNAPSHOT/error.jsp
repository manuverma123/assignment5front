<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sorry Something Went Wrong</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("currentAdmin") == null)
		response.sendRedirect("login.jsp");
	%>
	<div class="container text-center">
		<img
			src="https://png.pngtree.com/png-vector/20190804/ourmid/pngtree-computer-crash-error-failure-system-flat-color-icon-vector-png-image_1649893.jpg"
			class="img-fluid">
		<h3 class="display-3">Sorry! Something Went Wrong......</h3>
		<%=exception.getMessage()%>
		<a class="btn btn-primary btn-lg text-white mt-2" href="login.jsp">Home</a>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>
