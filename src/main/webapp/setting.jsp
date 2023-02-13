<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

.card:hover {
	text-decoration: none;
	color: #ffffff;
	background-color: #ed143d;
}
</style>

</head>
<body style="background-color: #fcf0fc">
	<%
	User u = (User)session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<h3 class="text-center p-3 text-primary">
			<b class="text-danger">Hello, </b><%=u.getName()%>
		</h3>
		<div class="row text-center">
			<div class="col-md-6">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body">
							<i class="fa-solid fa-book-open fa-3x text-warning"></i>
							<h3>Sell Old Book</h3>
							<p>Sell Book</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6">
				<a href="#">
					<div class="card">
						<div class="card-body">
							<i class="fa-solid fa-pen-to-square fa-3x text-primary"></i>
							<h3>Edit Profile</h3>
							<p>Login & Security</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 mt-3">
				<div class="card ">
					<div class="card-body">
						<i class="fa-solid fa-location-dot fa-3x text-danger"></i>
						<h3>Your Address</h3>
						<p><%=u.getAddress()%>,
							<%=u.getCity()%>,
							<%=u.getState()%> <%=u.getPincode()%></p>
					</div>
				</div>
			</div>
			<div class="col-md-4 mt-3">
				<a href="order.jsp?name=<%=u.getName()%>">
					<div class="card ">
						<div class="card-body">
							<i class="fa-solid fa-location-crosshairs fa-3x text-info"></i>
							<h3>My Order</h3>
							<p>Track your Order</p>

						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 mt-3">
				<a href="">
					<div class="card ">
						<div class="card-body">
							<i class="fa-solid fa-phone fa-3x text-primary"></i>
							<h3>Help Center</h3>
							<p>24x7 Service</p>

						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>