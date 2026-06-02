<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<style>
	*{
		text-align: center;
	}
	div{
		margin-left: 450px;
	}
</style>
<body>
	<%
		String name = (String)session.getAttribute("name");
		String email = (String)session.getAttribute("email");
	%>
	<h2 class="ms-4 mt-4">Hello, <%= name %> , <%= email %><i class="bi bi-person-fill"></i> </h2>
	<hr>
	<div class=" p-4 border border-3 border-dark rounded-3 w-25 bg-light">
		<a href="seeAllComplaintAdmin.jsp" > <button class="btn btn-primary">See All Complaint</button> </a> <br> <br>
		<a> <button class="btn btn-primary">See Resolved Complain</button> </a> <br> <br>
		<a> <button class="btn btn-primary">See Pending Complaint</button> </a> <br>	<br>
		<a href="logout.jsp" > <button class="btn btn-primary">Log Out</button> </a> <br>	<br>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>	
</body>
</html>