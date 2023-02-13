<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
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
<title>All Recent Books</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #f0eeb1;
}

.btn-sm {
	font-size: 14px;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	
	<c:if test="${not empty addCart}">
		<div id="toast">${addCart}</div>
		<script type="text/javascript">
			showToast();
			function showToast(content) {
				$('#toast').addClass("display");
				$('#toast').tml(content);
				setTimeout(()=>{
					$('#toast').removeClass("display")
				},2000)
			}
		</script>
		<c:remove var="addCart" scope="session" />
	</c:if>

	<div class="container-fluid">
		<div class="row p-3">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getAllRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getBphoto()%>"
							style="width: 40%; height: auto" class="img-thumblin"><br>
						<div class="a"><%=b.getBname()%></div>
						<div class="a text-primary">
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
						<a href="" class="btn btn-danger btn-sm ml-2"><i
							class="fas fa-cart-plus"></i> Add Cart</a> <a
							href="viewbook.jsp?bId=<%=b.getbId()%>"
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
	</div>
	<!-- </div> -->

</body>
</html>