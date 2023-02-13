<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container pt-2">
		<h3>About Us</h3>
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<br>
						<p>Hello, My Name is Sharishail Bagale</p>						
					</div>
				</div>
				<div class="card p-2">
					<div class="card-body">
						<h4 class="text-primary ">Contact us</h4>
						<p>
							<i class="fa-solid fa-location-dot text-danger"></i> Solapur
						<p>
							<i class="fa-solid fa-phone text-primary"></i> +91-9552245501
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>





	<%@include file="all_component/footer.jsp"%>
</body>
</html>