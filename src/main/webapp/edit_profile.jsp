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
<title>Profile Edits</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${not empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-10 offset-md-1">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<h3>Edit your Profile</h3>
						</div>
						<hr>
						<c:if test="${not empty failedMSG }">
							<div class="alert alert-danger text-center" role="alert">${failedMSG}</div>
							<c:remove var="failedMSG" scope="session" />
						</c:if>
						<c:if test="${not empty succMSG }">
							<div class="alert alert-success text-center" role="alert">${succMSG}</div>
							<c:remove var="succMSG" scope="session" />
						</c:if>
						<form action="update_profile" method="post">
							<div class="form-row">
								<input type="hidden" value="${userobj.id }" name="id">
								<div class="form-group col-md-6">
									<label for="inputName">Name</label> <input type="text"
										class="form-control" id="inputName" name="name"
										value="${userobj.name }">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail">Email</label> <input type="email"
										class="form-control" id="inputEmail" value="<%=u.getEmail()%>">
								</div>
								<div class="form-group col-md-6">
									<label for="inputMobile">Mobile Number</label> <input
										type="number" class="form-control" id="inputMobile"
										value="<%=u.getPhone()%>">
								</div>
								<div class="form-group col-md-6">
									<label for="inputAddress">Address</label> <input type="text"
										class="form-control" id="inputAddress"
										value="<%=u.getAddress()%>">
								</div>
								<div class="form-group col-md-6">
									<label for="inputCity">City</label> <input type="text"
										class="form-control" id="inputCity" value="<%=u.getCity()%>">
								</div>
								<div class="form-group col-md-6">
									<label for="inputState">State</label>
									<!--- India states -->
									<select class="form-control" id="country-state"
										name="country-state">
										<option class="bg-primary text-white"><%=u.getState()%></option>
										<option value="Andaman and Nicobar Islands">Andaman
											and Nicobar Islands</option>
										<option value="Andhra Pradesh">Andhra Pradesh</option>
										<option value="Arunachal Pradesh">Arunachal Pradesh</option>
										<option value="Assam">Assam</option>
										<option value="Bihar">Bihar</option>
										<option value="Chandigarh">Chandigarh</option>
										<option value="Chhattisgarh">Chhattisgarh</option>
										<option value="Dadra and Nagar Haveli">Dadra and
											Nagar Haveli</option>
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
										<option value="Maharashtra">Maharashtra</option>
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
									<label for="inputPincode">Pincode/ zip</label> <input
										type="number" class="form-control" id="inputPincode"
										value="<%=u.getPincode()%>">
								</div>
								<div class="form-group col-md-6">
									<label for="inputCity">Enter Correct Password</label> <input
										type="text" class="form-control" id="inputCity"
										value="<%=u.getPassword()%>">
								</div>
								<div>
									<button class="btn btn-warning">Change</button>
									<a href="setting.jsp" class="btn btn-success">Back </a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('input:text:first').focus();
			$('input:text').bind('keydown', function(e) {
				if (e.keyCode == 13) {
					e.preventDefault();
					var nextIndex = $('input:text').index(this) + 1;
					var maxIndex = $('input:text').length;
					if (nextIndex < maxIndex) {

						$('input:text:eq(' + nextIndex + ')').focus();
					}
				}
			});
		});
	</script>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>