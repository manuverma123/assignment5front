<%@page import="com.nagarro.training.entity.Author"%>

<%@ page import = "java.io.*,java.util.*, javax.servlet.*,java.text.*,java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.Statement" %>
<%@page errorPage="error.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Title</title>
<%@include file="common.jsp"%>
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
main {
  display: flex;
  justify-content: center;
  align-items: center; 
  flex-direction:column;
}
.inputs {
	padding: 5px;
	margin: 5px;
	margin-left: 20%;
	
}
#product-form{
margin-left:20%;
width:50%;
}

</style>

</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null)
		response.sendRedirect("login.jsp");
	%>

	<%
	Date date = new Date();
	String dateToStr = DateFormat.getDateInstance().format(date);  
		Author author=(Author)request.getAttribute("books");
	%>
	
	<% 
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = 
			         DriverManager.getConnection
			            ("jdbc:mysql://localhost/assignment_5?user=root&password=root");

			       Statement statement = connection.createStatement() ;

			       ResultSet resultSet =statement.executeQuery("select * from author") ;
			%>


	<header>
		<div class="left">
			<h3>Edit Library Management Tool</h3>
		</div>

<div class="right" style="display: flex; justify-content: flex-end">
			<span id="welcome">Welcome ${user}</span>
			<form action="logout" method="post" id="form-1">
				<button type="submit" class="btn btn-outline-primary">Logout</button>
			</form>
		</div>
	</header>
	
	<main>

	<b>Please enter product details to update</b>
				
	
	<form id="product-form" action="update" method="post" class="inputs" >
	Book Code : <input class="inputs" type="text" name="id" value="<%=author.getId() %>" readonly ><br>
	Book Author: <%-- <input type="text" name="upAuthor" value="<%=author.getAuthor()%>"><br> --%>
	<select name="upAuthor" class="inputs" required>
				<%  while(resultSet.next()){ %>
            <option><%= resultSet.getString(2)%></option>
        <% } %>
				</select>
				
				<br>
	Book Name: <input class="inputs" type="text" name="upBook" value="<%=author.getBook() %>"><br>
	Book Date : <input class="inputs" type="text" name="date" value="<%=author.getDate()%>" readonly><br>
	<button type="submit" class="btn btn-primary">Submit</button>	
				<a href="Cancel" class="btn btn-danger" role="button">Cancel</a>
	</form>
	</main>
	
	
	

	
</body>
</html>