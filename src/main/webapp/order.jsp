<%@page import="com.entity.Book_Order"%>
<%@page import="com.entity.Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Order Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #fcfcfc;">

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<h3 class="text-center p-3 text-primary">
		<b class="text-danger"></b> My Ordered Books
	</h3>
	<c:if test="${not empty succMSG }">
		<div class="alert alert-success text-center" role="alert">${succMSG}</div>
		<c:remove var="succMSG" scope="session" />
	</c:if>
	<c:if test="${not empty failedMSG}">
		<div class="alert alert-danger text-center" role="alert">${failedMSG}</div>
		<c:remove var="failedMSG" scope="session" />
	</c:if>
	<div class="card">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead class="bg-primary text-white">
						<tr>
							<th scope="col">Order Id</th>
							<th scope="col">Name</th>
							<th scope="col">Phone</th>
							<th scope="col">Address</th>
							<th scope="col">Book Name</th>
							<th scope="col">Author</th>
							<th scope="col">Price</th>
							<th scope="col">Order Date</th>
							<th scope="col">Payment Type</th>
						</tr>
					</thead>
					<tbody>
						<%
						User u = (User) session.getAttribute("userobj");
						BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
						List<Book_Order> blist = dao.getBook(u.getEmail());

						for (Book_Order b : blist) {
						%>
						<tr>
							<th scope="row"><%=b.getOrderid()%></th>
							<td><%=b.getUsername()%></td>
							<td><%=b.getPhone()%></td>
							<td><%=b.getFullAdd()%></td>
							<td><%=b.getBname()%></td>
							<td><%=b.getBauthor()%></td>
							<td><%=b.getBprice()%></td>
							<td><%=b.getOrder_date()%></td>
							<td><%=b.getPaymentType()%></td>
						</tr>

						<%
						}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>


	<%@include file="all_component/footer.jsp"%>
</body>
</html>