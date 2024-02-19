<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@include file="all_component/allCss.jsp"%>

<style>
.MuiOutlinedInput-input {
	padding: 18.5px 14px;
}

.MuiInputBase-input {
	font: inherit;
	color: currentColor;
	width: 100%;
	border: 0;
	height: 1.1876em;
	margin: 0;
	display: block;
	padding: 6px 0 7px;
	min-width: 0;
	background: none;
	box-sizing: content-box;
	animation-name: mui-auto-fill-cancel;
	letter-spacing: inherit;
	animation-duration: 10ms;
	-webkit-tap-highlight-color: transparent;
}

.MuiOutlinedInput-root {
	position: relative;
	border-radius: 4px;
}

.MuiInputBase-fullWidth {
	width: 100%;
}

.MuiInputBase-root {
	color: #2c2c2b;
	cursor: text;
	display: inline-flex;
	position: relative;
	font-size: 1rem;
	box-sizing: border-box;
	align-items: center;
	font-family: Roboto;
	font-weight: 400;
	line-height: 1.1876em;
}
</style>
</head>
<body style="background-color: #fcfcfc">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<div class="container pt-2">
		<div class="row p-2">
			<div class="col-md-7">
				<c:if test="${not empty succMSG }">
					<div class="alert alert-success text-center" role="alert">${succMSG }</div>
					<c:remove var="succMSG" scope="session" />
				</c:if>
				<c:if test="${not empty failed }">
					<div class="alert alert-danger text-center" role="alert">${failed }</div>
					<c:remove var="failed" scope="session" />
				</c:if>

				<div class="card">
					<h4 class="text-center text-info">Your Selected Item</h4>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Book Name</th>
										<th scope="col">Author</th>
										<th scope="col">Price</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody>
									<%
									User u = (User) session.getAttribute("userobj");

									CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
									List<Cart> cart = dao.getBookByUser(u.getId());
									double totalPrice = 0D;
									for (Cart c : cart) {
										totalPrice = c.getTotalprice();
									%>
									<tr>
										<td><%=c.getBname()%></td>
										<td><%=c.getBauthor()%></td>
										<td><%=c.getBprice()%></td>
										<td><a
											href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid() %>"
											class="btn btn-danger btn-sm">Remove</a></td>
									</tr>
									<%
									}
									%>
									<tr class="bg-info text-white">
										<td class="fs-1">Total Price =</td>
										<td></td>
										<td><%=totalPrice%></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-5">
				<div class="card">
					<div class="card-body">
						<c:if test="${not empty succmsg }">
							<div class="alert alert-success text-center" role="alert">${succmsg }</div>
							<c:remove var="succmsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedmsg }">
							<div class="alert alert-danger text-center" role="alert">${failedmsg }</div>
							<c:remove var="failedmsg" scope="session" />
						</c:if>
						<h4 class="text-center text-info">Where to Order Book?</h4>
						<form action="order" method="post">
							<input type="hidden" value="${userobj.id }" name="id"> <input
								type="hidden" id="currentDate" name="order_date">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputName">Name</label> <input type="text"
										name="username" class="form-control" id="inputName"
										value="<%=u.getName()%>" readonly="readonly">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail">Email</label> <input type="email"
										name="email" class="form-control" id="inputEmail"
										value="<%=u.getEmail()%>" readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label for="inputAddress">Address</label> <input type="text"
									name="address" class="form-control" id="inputAddress"
									value="<%=u.getAddress()%>">

							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputMobile">Mobile Number</label> <input
										type="text" class="form-control" id="inputMobile" name="phone"
										value="<%=u.getPhone()%>">
								</div>
								<div class="form-group col-md-6">
									<label for="inputCity">City</label> <input type="text"
										name="city" class="form-control" id="inputCity"
										value="<%=u.getCity()%>">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputCity">City</label> <input type="text"
										name="state" class="form-control" id="inputCity"
										value="<%=u.getState()%>">
								</div>


								<div class="form-group col-md-6">
									<label for="inputPincode">Pincode</label> <input type="number"
										name="pincode" class="form-control" id="inputPincode"
										value="<%=u.getPincode()%>">
								</div>
							</div>
							<div class="form-group">
								<label>Payment Mode</label> <select class="form-control"
									name="paymentType">
									<option value="noselect">--Select--</option>
									<option value="COD">Cash on Delivery</option>
									<option value="OP">Online Payment</option>
								</select>
							</div>
							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>

	<script>
		var today = new Date();
		var date = today.getDate() + '/' + (today.getMonth() + 1) + '/'
				+ today.getFullYear();
		document.getElementById("currentDate").value = date;
	</script>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>