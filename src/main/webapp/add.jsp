<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*, javax.servlet.*,java.text.*,java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.Statement" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="common.jsp"%>
<style>
  input[readonly] {
    border: none;
    background-color: transparent;
    font-size: inherit;
    font-family: inherit;
    color: inherit;
    text-align: left;
    cursor: default;
  }
  
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
					
         Date date = new Date();
		String dateToStr = DateFormat.getDateInstance().format(date);  
					
      %>
      <header>
      <div>
			<b>ADD Library Management Tool</b>
		</div>

<div class="right" style="display: flex; justify-content: flex-end">
			<span id="welcome">Welcome ${user}</span>
			<form action="logout" method="post" id="form-1">
				<button type="submit" class="btn btn-outline-primary">Logout</button>
			</form>
		</div>
      </header>

		<main>

			<div>
				<div></div>
				<div>
					<b>Add Book Details</b>
				</div>
			</div>

			<% 
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = 
			         DriverManager.getConnection
			            ("jdbc:mysql://localhost/assignment_5?user=root&password=root");

			       Statement statement = connection.createStatement() ;

			       ResultSet resultSet =statement.executeQuery("select * from author") ;
			%>
			
			<form id="product-form" action="add" method="post">
				<div class="log">
				Book Code : <input type="number" name="code" class="inputs" required><br>
				<%
			if (request.getAttribute("error") != null) {
			%>
			<h5><%=request.getAttribute("error")%></h5>
			<%
			}
			%>
				Book Name : <input type="text" name="bookName" class="inputs" required><br>
				Select Author : 
				<select name="bookAuthor" class="inputs" required>
				<%  while(resultSet.next()){ %>
            <option><%= resultSet.getString(2)%></option>
        <% } %>
				</select>
				
				<br>
				Today's Date : <input class="inputs" type="text" value="<%=dateToStr%>" readonly="readonly"><br>
				</div>
				<div id="submit">
				
				<button type="submit" class="btn btn-primary">Submit</button>	
				<a href="Cancel" class="btn btn-danger" role="button">Cancel</a>
				</div>

			</form>

</main>

	




</body>
</html>