<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cancel Complaint</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>

	<form action="cancelComplaint.jsp" class="border border-2 rounded w-50 p-2 border-dark bg-light shadow p-3 mb-5 bg-body-tertiary rounded " style="margin-top: 70px; margin-left: 26%;" >
	<h2 class="text-center text-primary">Cancel Complaint</h2> <hr>
	
	<dt>Complaint Id</dt>
	<dd> <input class="form-control" type="number" name="cid" placeholder="Enter Complaint Id"> </dd>
		
	<dd> <button style="margin-left: 40%" class="btn btn-outline-primary mt-2" >Cancel Complaint</button> </dd>
			
	</form>
	
	<%
		String email = (String)session.getAttribute("email");
		String id = request.getParameter("cid");
		
		if(id!=null)
		{
			int cid = Integer.parseInt(id);
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/customer";
				Connection connection = DriverManager.getConnection(url , "root" , "admin");
				
				String sql = "DELETE FROM complaint WHERE cid=?";
				
				PreparedStatement ps = connection.prepareStatement(sql);
				ps.setInt(1, cid);
				
				int res = ps.executeUpdate();
				
				if(res>0){
					RequestDispatcher dispatcher = request.getRequestDispatcher("user.jsp?deleted=true&cid="+cid);
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