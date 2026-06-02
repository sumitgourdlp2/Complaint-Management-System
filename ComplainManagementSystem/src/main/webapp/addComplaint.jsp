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
	
	<form action="addComplaint.jsp" class="border border-2 rounded w-50 p-2 border-dark bg-light shadow p-3 mb-5 bg-body-tertiary rounded " style="margin-top: 70px; margin-left: 26%;" >
	<h2 class="text-center text-primary">Add Complaint</h2> <hr>
	<dt>Subject</dt>
	<dd> <input class="form-control" type="text" name="subject" placeholder="Enter Complaint Subject"> </dd>
	
	<dt> <label class="form-label" >Description</label> </dt>
	<dd> <textarea  rows="5" cols="" class="form-control"  name="description" ></textarea> </dd>
	
	<dd> <button style="margin-left: 40%" class="btn btn-outline-primary mt-2" >Add Complaint</button> </dd>
			
	</form>
	
	<%
		String email = (String)session.getAttribute("email");
		String subject = request.getParameter("subject");
		String description = request.getParameter("description");
		String status = "Raised";
		
		if(subject!=null && description!=null)
		{
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/customer";
				Connection connection = DriverManager.getConnection(url , "root" , "admin");
				
				LocalDate todayDate = LocalDate.now();
				
				String sql = "INSERT INTO complaint (subject , description , email , status , created_on) VALUES (?,?,?,?,?)";
				PreparedStatement ps = connection.prepareStatement(sql);
				ps.setString(1, subject);
				ps.setString(2, description);
				ps.setString(3, email);
				ps.setString(4, status);
				ps.setObject(5, todayDate);
				
				int res = ps.executeUpdate();
				
				ResultSet set = ps.executeQuery("SELECT * FROM complaint WHERE subject='"+subject+"'");
				int cid = 0;
				if(set.next()){
					cid = set.getInt("cid");
				}
				
				if(res>0 && cid!=0){
					System.out.println("From Add : "+cid);
					RequestDispatcher dispatcher = request.getRequestDispatcher("user.jsp?raiseStatus='raised'&cid="+cid);
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