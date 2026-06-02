<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
	
	<h1 style="text-align: center;" class="" >SignUp</h1> <hr>	
	
	<form action="signup.jsp" method="post" class="border border-3 border-dark w-25 p-3 rounded-3 " style="margin:auto; " >
		<h2> <i class="bi bi-person-add"></i> Register </h2>
		<dt>Name</dt>
		<dd> <input class="w-100 form-control" type="text" name="name" placeholder="Enter Your Name" > </dd>
		<dt>Email</dt>
		<dd> <input class="w-100 form-control" type="email" name="email" placeholder="Enter Your Email address" > </dd>
		<dt>Password</dt>
		<dd> <input class="w-100 form-control" type="password" name="password" placeholder="Enter Your Password" > </dd>
		<dt>Number</dt>
		<dd> <input class="w-100 form-control" type="tel" name="number" placeholder="Enter Your Number" > </dd>
		<dt>Type</dt>
		<dd>
			<label> <input type="radio" class="form-check-input" name="type" value="Admin"> Admin </label>
		    <label> <input type="radio" class="form-check-input" name="type" value="User"> User </label>		
  		</dd>	
		<dd> <button style="margin-left: 35%;" class="rounded btn btn-primary mt-1" >Signup</button> </dd>
	</form>
	
	<%
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String num = request.getParameter("number");
		String type = request.getParameter("type");
		String reqMethod = request.getMethod();
		
		if(name!=null && email!=null && password!=null && num!=null && type!=null  && reqMethod.equals("POST"))
		{
			long number = Long.parseLong(num);
			
/*			System.out.println(name);
			System.out.println(email);
			System.out.println(password);
			System.out.println(number);
			System.out.println(type);
			System.out.println(reqMethod);
*/
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/customer";
				Connection connection = DriverManager.getConnection(url , "root" , "admin");
				
				PreparedStatement ps = connection.prepareStatement("INSERT INTO CUSTOMERS VALUES (?,?,?,?,?)");
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, password);
				ps.setLong(4, number);
				ps.setString(5, type);
				
				int res = ps.executeUpdate();
				
				if(res>0)
				{
					RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
					dispatcher.forward(request, response);
				}				
			}
			catch(ClassNotFoundException | SQLException e){
				e.printStackTrace();
			}
		}
	
	%>
		
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>