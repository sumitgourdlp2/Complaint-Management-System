<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<style>
	h2{
		text-align: center;
	}
</style>
<body>
	
	<h1 style="text-align: center;" class="text-primary" >Login</h1> <hr>	
	<form action="login.jsp" method="get" class="border border-3 border-dark w-25 p-3 rounded-3 shadow p-3 mb-5 bg-body-tertiary rounded" style="margin:auto; " >
		<dt>Email</dt>
		<dd> <input class="w-100 form-control" type="email" name="email" placeholder="Enter Your Email address" > </dd>
		<dt>Password</dt>
		<dd> <input class="w-100 form-control" type="password" name="password" placeholder="Enter Your Password" > </dd>

		<dd> <button style="margin-left: 35%;" class="rounded btn btn-outline-primary mt-1" >Login</button> </dd>
	</form>
	
	<%
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String reqMethod = request.getMethod();
		
		if(email!=null && password!=null && reqMethod.equals("GET"))
		{	
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/customer";
				Connection connection = DriverManager.getConnection(url, "root" , "admin");
				
				String query = "SELECT * FROM CUSTOMERS WHERE email=?";
				PreparedStatement statement = connection.prepareStatement(query);
				statement.setString(1, email);
				ResultSet set = statement.executeQuery();
				
				session.setAttribute("email", email);
				
				if(set.next())
				{
					String db_password = set.getString("password");
					String db_type = set.getString("type");
					String db_name = set.getString("name");
					session.setAttribute("name", db_name);
					
					if(password.equals(db_password))
					{
						out.println("<h2 class='text-success mt-3'>Login Success</h2>");
						System.out.println(db_type);
						if(db_type.equals("Admin")){
							RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
							dispatcher.forward(request, response);
						}
						else if(db_type.equals("User")){
							RequestDispatcher dispatcher = request.getRequestDispatcher("user.jsp");
							dispatcher.forward(request, response);
						}
					}
					else
					{
						out.println("<h2 class='text-danger mt-3'>Invalid Password</h2>");
					}
				}
				else
				{
					out.println("<h2 class='text-danger mt-3' >Invalid Email....</h2>");
				}
			}
			catch(ClassNotFoundException | SQLException e)
			{
				e.printStackTrace();
			}
		}
	
	%>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>