<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login-EBooks</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #fcfcfc;">
	<%@include file="all_component/navbar.jsp"%>

	<!-- Start Login Page -->
	<div class="container p-3">
		<div class="row">
			<div class="offset-md-3">
				<div class="card">
					<div class="card-body">

						<div class="text-center">
							<img alt="" src="img/UserLogin.gif" style="width: 50%;">
						</div>

						<c:if test="${not empty failedMSG }">
							<div class="alert alert-danger text-center" role="alert">${failedMSG}</div>
							<c:remove var="failedMSG" scope="session" />
						</c:if>
						<c:if test="${not empty succMSG }">
							<div class="alert alert-success text-center" role="alert">${succMSG}</div>
							<c:remove var="succMSG" scope="session" />
						</c:if>

						<form action="login" method="post">
							<div class="form-group ">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" aria-describedby="emailHelp"
									placeholder="Enter Email Address" required="required"
									name="email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email & Password with anyone else.</small>
							</div>
							<div class="form-group ">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" placeholder="Enter Current Password"
									name="password">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">
									<i class="fas fa-sign-in-alt"></i> Login
								</button>
								<hr>
								<div class="container">
									<div class="row">
										<div class="col-md-6">
											<a href="register.jsp">Create Account</a>
										</div>
										<div>
											<a class="text-danger" href="register.jsp">Forget
												Password?</a>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Login Page -->
	<%@include file="all_component/footer.jsp"%>
</body>
</html>