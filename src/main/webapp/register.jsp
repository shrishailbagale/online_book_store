<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Register- EBooks</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<!-- Start Registration Page -->
	<div class="container p-2">
		<div class="row">
			<!-- <div class="col-md-6 offset-md-2"> -->
			<div class="card">
				<div class="card-body">

					<div class="text-center">
						<h3>New Create Account !</h3>

					</div>

					<c:if test="${not empty succMSG}">
						<div class="alert alert-success text-center" role="alert">${succMSG}</div>
						<c:remove var="succMSG" scope="session" />
					</c:if>
					<c:if test="${not empty failedMSG }">
						<div class="alert alert-danger text-center" role="alert">${failedMSG}</div>
						<c:remove var="failedMSG" scope="session" />
					</c:if>

					<form action="register" method="post">
						<div class="form-row">

							<div class="form-group col-md-6">
								<label for="exampleInputEmail1">Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Full Name"
									required="required" name="name">
							</div>
							<div class="form-group col-md-6">
								<label for="exampleInputEmail1">Mobile Number</label> <input
									type="number" class="form-control" id="mobile"
									placeholder="Enter Mobile Number" required="required"
									name="phone">
							</div>
							<div class="form-group col-md-6">
								<label for="exampleInputPassword1">Village</label> <input
									type="text" class="form-control" name="address"
									id="exampleInputPassword1" required="required">
							</div>
							<div class="form-group col-md-6">
								<label for="exampleInputPassword1">City/Taluka</label> <input
									type="text" class="form-control" name="city"
									id="exampleInputPassword1" required="required">
							</div>
							<div class="form-group col-md-6">
								<label for="inputState">State</label>
								<!--- India states -->
								<select class="form-control" id="country-state" name="state">
									<option value="Andaman and Nicobar Islands">Andaman
										and Nicobar Islands</option>
									<option value="Andhra Pradesh">Andhra Pradesh</option>
									<option value="Arunachal Pradesh">Arunachal Pradesh</option>
									<option value="Assam">Assam</option>
									<option value="Bihar">Bihar</option>
									<option value="Chandigarh">Chandigarh</option>
									<option value="Chhattisgarh">Chhattisgarh</option>
									<option value="Dadra and Nagar Haveli">Dadra and Nagar
										Haveli</option>
									<option value="Daman and Diu">Daman and Diu</option>
									<option value="Delhi">Delhi</option>
									<option value="Goa">Goa</option>
									<option value="Gujarat">Gujarat</option>
									<option value="Haryana">Haryana</option>
									<option value="Himachal Pradesh">Himachal Pradesh</option>
									<option value="Jammu and Kashmir">Jammu and Kashmir</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Karnataka">Karnataka</option>
									<option value="Kerala">Kerala</option>
									<option value="Ladakh">Ladakh</option>
									<option value="Lakshadweep">Lakshadweep</option>
									<option value="Madhya Pradesh">Madhya Pradesh</option>
									<option value="Maharashtra" selected="selected">Maharashtra</option>
									<option value="Manipur">Manipur</option>
									<option value="Meghalaya">Meghalaya</option>
									<option value="Mizoram">Mizoram</option>
									<option value="Nagaland">Nagaland</option>
									<option value="Odisha">Odisha</option>
									<option value="Puducherry">Puducherry</option>
									<option value="Punjab">Punjab</option>
									<option value="Rajasthan">Rajasthan</option>
									<option value="Sikkim">Sikkim</option>
									<option value="Tamil Nadu">Tamil Nadu</option>
									<option value="Telangana">Telangana</option>
									<option value="Tripura">Tripura</option>
									<option value="Uttar Pradesh">Uttar Pradesh</option>
									<option value="Uttarakhand">Uttarakhand</option>
									<option value="West Bengal">West Bengal</option>
								</select>
							</div>
							<div class="form-group col-md-6">
								<label for="exampleInputPassword1">Pincode</label> <input
									type="number" class="form-control" name="pincode"
									id="exampleInputPassword1" required="required">
							</div>
							<div class="form-group col-md-6">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter E-mail Address"
									required="required" name="email">
							</div>
							<div class="form-group col-md-6">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" placeholder="Enter New Password"
									name="password">
							</div>
						</div>
						<div class="form-check text-center">
							<input type="checkbox" class="form-check-input" name="check"
								id="exampleCheck1"> <label class="form-check-label"
								for="exampleCheck1">Accept <a href="term.jsp">Term</a>
								and <a href="condition.jsp">Condition</a></label>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary  btn-block">Submit</button>
							<br> <a href="login.jsp">Login Here</a>
						</div>

					</form>
				</div>
			</div>
		</div>

	</div>
	<!-- End Registration Page -->
	<%@include file="all_component/footer.jsp"%>
</body>
</html>