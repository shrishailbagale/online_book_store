<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%><!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Book Details</title>
<%@include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #fcfcfc;">
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bId"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>


	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img alt="" style="width: 25%; height: auto"
					src="book/<%=b.getBphoto()%>  ">


				<table class="table mt-3 h6">
					<tr>
						<td>Book Name:</td>
						<td><span class="text-danger"><%=b.getBname()%></span></td>
					</tr>
					<tr>
						<td>Author Name:</td>
						<td><span class="text-info">@ <%=b.getBauthor()%></span></td>
					</tr>
					<tr>
						<td>Category:</td>
						<td><span class="text-warning"><%=b.getBcategory()%></span></td>
					</tr>
				</table>
			</div>
			<div class="col-md-6 text-center pt-3 p-5 border bg-white">
				<h2><%=b.getBname()%></h2>
				<%
				if ("Old Book".equals(b.getBcategory())) {
				%>
				<h5 class="text-primary">Contact to Seller</h5>
				<h5 class="text-primary">
					<i class="far fa-envelope"></i> Email:
					<%=b.getEmail()%>
				</h5>
				<%
				}
				%>
				<div class="row mt-2">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-indian-rupee-sign fa-2x"></i>
						<p>Cash on Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Shopping</p>
					</div>
				</div>

				<%
				if ("Old Book".equals(b.getBcategory())) {
				%>
				<div class="text-center p-3">
					<a href="" class="btn btn-success"><i class="fas fa-cart-plus"></i>
						Continue Shopping </a> <a href="" class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i> <%=b.getBprice()%></a>
				</div>
				<%
				} else {
				%>
				<div class="text-center p-3">
					<a href="cart?bid=<%=b.getbId()%>&&uid=<%=u.getId()%>" class="btn btn-primary"><i
						class="fas fa-cart-plus"></i> Add Cart</a> <a href=""
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i> <%=b.getBprice()%></a>
				</div>

				<%
				}
				%>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>

</body>
</html>