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
<title>E-Book Management System</title>
<%@include file="all_component/allCss.jsp"%>

<style type="text/css">
.back-img {
	background: url("img/b.jpg");
	height: 35vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #f0eeb1;
}

.btn-sm {
	font-size: 10px;
}

.b {
	white-space: nowrap;
	width: 100%;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	 <%
	User u = (User) session.getAttribute("userobj");
	%> 

	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<%@include file="all_component/slider.jsp"%>
	</div>

	<!-- Start Recent Book -->
	<div class="container" id="recentbook"
		style="background-color: #fcfcfc;">
		<h4 class=" text-primary text-center">
			<b class="text-danger ">--- Recent Books ---</b>
		</h4>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getBphoto()%>"
							style="width: 40%; height: auto" class="img-thumblin"><br>
						<div class="a b"><%=b.getBname()%></div>
						<div class="a b text-primary">
							<i class="fa-solid fa-at"></i>
							<%=b.getBauthor()%></div>
						<div class="a">
							<%
							if (b.getBcategory().equals("Old Book")) {
							%>
							<div class="row-3">
								Category: <b class="text-warning"><%=b.getBcategory()%><img
									style="width: 15%;" alt="" src="img/new-icon-animated.gif"></b>
							</div>
							<a href="viewbook.jsp?bId=<%=b.getbId()%>"
								class="btn btn-success btn-sm ml-1"><i class="fas fa-eye"></i>
								View</a> <a class=""><i class="fas fa-rupee-sign"></i> <%=b.getBprice()%></a>
						</div>
						<%
						} else {
						%>
						Category: <b class="text-warning"><%=b.getBcategory()%><img
							style="width: 15%;" alt="" src="img/new-icon-animated.gif"></b>
					</div>
					<div class="row-3">
						<%
						if (u == null) {
						%>

						<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
							class="fas fa-cart-plus"></i> Add Cart</a>
						<%
						} else {
						%>
						<a href="cart?bid=<%=b.getbId()%>&&uid=<%=u.getId()%>"
							class="btn btn-danger btn-sm ml-2"><i
							class="fas fa-cart-plus"></i> Add Cart</a>
						<%
						}
						%>

						<a href="viewbook.jsp?bId=<%=b.getbId()%>"
							class="btn btn-success btn-sm ml-1"><i class="fas fa-eye"></i>
							View</a> <a class=""><i class="fas fa-rupee-sign"></i> <%=b.getBprice()%></a>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
		<%
		}
		%>
	</div>
	<div class="text-right mt-1">
		<a href="all_recent_book.jsp"
			class="btn btn-danger btn-sm row-8 text-white">View All</a>
	</div>

	<!-- End Recent Book -->
	<hr>
	<!-- Start New Book -->
	<div class="container" id="newbook" style="background-color: #fcfcfc;">
		<h4 class="text-center text-danger">--- New Books ---</h4>
		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getBphoto()%>"
							style="width: 40%; height: auto" class="img-thumblin">
						<div class="a b"><%=b.getBname()%>
						</div>
						<div class="a b text-primary">
							<i class="fa-solid fa-at"></i>
							<%=b.getBauthor()%>
						</div>
						<div class="a">
							Category: <b class="text-warning"><%=b.getBcategory()%></b>
						</div>
						<div class="row-3">
							<%
							if (u == null) {
							%>

							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getbId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							}
							%>
							<a href="viewbook.jsp?bId=<%=b.getbId()%>"
								class="btn btn-success btn-sm ml-1"><i class="fas fa-eye"></i>View</a>
							<a class="text-right"><i class="fas fa-rupee-sign"></i> <%=b.getBprice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-right mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<!-- End New Book -->
	<hr>
	<!-- Start Old Book -->
	<div class="container" style="background-color: #fcfcfc;">
		<h4 class="text-center text-primary">
			<b class="text-danger" id="oldbook">--- Old Books ---</b>
		</h4>
		<div class="row">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBook();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getBphoto()%>"
							style="width: 40%; height: auto" class="img-thumblin"><br>
						<div class="a b"><%=b.getBname()%></div>
						<div class="a b text-primary">
							<i class="fa-solid fa-at"></i>
							<%=b.getBauthor()%></div>
						<div class="a">
							Category: <b class="text-warning"><%=b.getBcategory()%></b>
						</div>
						<div class="row-3">
							<a href="viewbook.jsp?bId=<%=b.getbId()%>"
								class="btn btn-success btn-sm ml-1"><i class="fas fa-eye"></i>
								View</a> <a class="text-right"><i class="fas fa-rupee-sign"></i>
								<%=b.getBprice()%></a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<div class="text-right mt-1">
				<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View
					All</a>
			</div>
		</div>
	</div>
	<!-- End Old Book -->
	<br>
	<br>
	<br>
	<br>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>