<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Home</title>
<%@include file="allCss.jsp"%>
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
<body style="background-color: #fcfcfc;">
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<h3 class="text-center p-3 text-primary">
		<b class="text-danger">Admin: </b>Home Page
	</h3>
	<div class="container">
		<div class="row text-center">
			<div class="col-md-3 pb-3">
				<a href="add_book.jsp">
					<div class="card">
						<div class="card-body">
							<i class="fa-solid fa-square-plus fa-3x text-primary"></i>
							<h4>Add Books</h4>
							--------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3 pb-3">
				<a href="all_book.jsp">
					<div class="card">
						<div class="card-body">
							<i class="fa-solid fa-book fa-3x text-danger"></i>
							<h4>All Books</h4>
							--------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3 pb-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body">
							<i class="fa-solid fa-box-open fa-3x text-warning"></i>
							<h4>Order</h4>
							--------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3 pb-3">
				<a href="user_details.jsp">
					<div class="card">
						<div class="card-body">
							<i class="fa-solid fa-users-gear fa-3x text-info"></i> <i
								class="fa-solid fa-screen-users fa-3x text-info"></i>
							<h4>User Details</h4>
							--------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3 pb-3 ">
				<a href="ricycle-bin.jsp">
					<div class="card">
						<div class="card-body">
							<i class="fa-solid fa-trash fa-3x text-danger"></i>
							<h4>Ricycle bin</h4>
							--------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3 pb-3 ">
				<a href="#">
					<div class="card">
						<div class="card-body">
							<i class="fa-solid fa-circle-chevron-down fa-3x text-primary"></i>
							<h4>More</h4>
							--------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3 pb-3">
				<a href="feedback.jsp">
					<div class="card">
						<div class="card-body">
							<i class="fa-solid fa-comment fa-3x text-warning"></i></i>
							<h4>Feedback</h4>
							<i class="fa fa-star " aria-hidden="true"></i><i
								class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
								aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
								class="fa fa-star" aria-hidden="true"></i>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3 pb-3">
				<a data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card">
						<div class="card-body">
							<i class="fa-solid fa-right-from-bracket fa-3x text-danger"></i>
							<h4>LogOut</h4>
							--------
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>