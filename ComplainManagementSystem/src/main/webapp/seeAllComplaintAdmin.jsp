<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.awt.geom.Path2D"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add A Complaint</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
	
	<h2 class="text-center text-primary mt-2">All Complaint</h2> <hr>
	<table class=" table table-sm w-75 table-bordered border border-3 border-dark text-center " style="margin-left: 15%" >
		
			<tr>
				<th>Complaint Id</th>
				<th>Subject</th>
				<th>Description</th>
				<th>Email</th>
				<th>Status</th>
				<th>Raised On</th>
				<th>Action</th>
			 </tr>
		 <tbody class="table-group-divider">
							
	<%
			String email = (String)session.getAttribute("email");
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/customer";
				Connection connection = DriverManager.getConnection(url , "root" , "admin");
				
				String sql = "SELECT * FROM COMPLAINT";
				PreparedStatement ps = connection.prepareStatement(sql);
				ResultSet set = ps.executeQuery();
				
				while(set.next())
				{
					int cid = set.getInt("cid");
					String subject = set.getString("subject");
					String description = set.getString("description");
					String status = set.getString("status");
					Date date = set.getDate("created_on");
								
	%>	
		<tr>
			<td> <%= cid %> </td>
			<td> <%= subject %> </td>
			<td> <%= description %> </td>
			<td> <%= email %> </td>
			<td> <%= status %> </td>
			<td> <%= date %> </td>
			<td> <button class="btn btn-primary" >Approve</button> <button class="btn btn-primary" >Reject</button> </td>
		</tr>
					
		<%
				}
			}
			catch(ClassNotFoundException | SQLException e){
				e.printStackTrace();
			}
		%>	
	
	</tbody>	
	</table>
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>		
</body>
</html>