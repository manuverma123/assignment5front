<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" errorPage="error.jsp"%>
<%@page import="java.util.*"%>
<%@page import="com.nagarro.training.dao.AuthorDao"%>
<%@page import="com.nagarro.training.entity.Author"%>
<%@page import="com.nagarro.training.services.ServiceImpl"%>
<%@page errorPage="error.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/home.css">
<title>Title</title>
<style type="text/css">
header{
background-color:#cceeff;
padding:10px;
}
footer{
background-color:#cceeff;

display: flex;
  justify-content: center;
}
#listing{
display: flex;
  justify-content: center;
}
</style>
</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	 if (session.getAttribute("user") == null)
		response.sendRedirect("login.jsp"); 
	%>
	

	<header>
		<div >
			<h3>Library Management Tool</h3>
		</div>

		<div class="right" style="display: flex; justify-content: flex-end">
			<span id="welcome">Welcome ${user}</span>
			<form action="logout" method="post" id="form-1">
				<button type="submit" class="btn btn-outline-primary">Logout</button>
			</form>
		</div>
	</header>
	
	
	<main>
	<div class="right" style="display: flex; justify-content: flex-end">
	<a class="btn btn-primary" href="add.jsp" role="button">Add a Book</a></div>
	<div id="listing">
		<h4>Book Listing</h4>
	</div>
	



	<br>
	



	<section class="container mt-4">
		<div>
			<table class="table table-bordered table-light">
				<thead>
					<tr>
						<th scope="col">Book Id</th>
						<th scope="col">Author</th>
						<th scope="col">Book Name</th>
						<th scope="col">Date</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody id="tBody">
				<%  List<Author> tlist=(List<Author>)request.getAttribute("books");  
				/* List<Author> tlist=(List<Author>)new Service().findAll(); */
				%>
				
				<% if(tlist!=null){
					int id=1;
					for(Author author:tlist){
					
					%>
					
					<tr>
					<td><%out.print(id); %></td>
					<td><%out.print(author.getAuthor()); %></td>
					<td><%out.print(author.getBook()); %></td>
					<td><%out.print(author.getDate());%></td>
					
					<td><a class="btn btn-primary" href="Edit?id=<%=author.getId() %>" role="button">Edit</a>
					<a class="btn btn-primary" href="Delete?id=<%=author.getId() %>" role="button">Delete</a>
					</td>
					</tr>
					<%
					id++;
					}
					}%>
				
				</tbody>
					
			</table>
		</div>
	</section>
	</main>
	
	
	


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>