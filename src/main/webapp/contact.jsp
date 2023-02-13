<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Me</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<h2 class="text-center">Contact Us</h2>
	<div class="container">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th scope="col">Sr.No.</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Phone</th>
				<th scope="col">Address</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>Shrishail Bagale</td>
				<td>shrishailbagale3@gmail.com</td>
				<td>9552245501</td>
				<td>Pune</td>

			</tr>
			<tr>
				<th scope="row">2</th>
				<td>Alwyn Rodrigues</td>
				<td>alwyn@gmail.com</td>
				<td>9886545455</td>
					<td>Pune</td>
				</tr>
		</tbody>
	</table>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>