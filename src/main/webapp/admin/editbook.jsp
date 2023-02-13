
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Add books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="navbar.jsp"%>
	<h4 class="text-center p-3 text-primary">
		<b class="text-danger">Admin:</b> Edit Books
		<c:if test="${empty failed}">
			<div class="alert alert-danger text-center" role="alert">${failed}</div>
			<c:remove var="failed" scope="session" />
		</c:if>
		<c:if test="${not empty succ}">
			<div class="alert alert-success text-center" role="alert">${succ}</div>
			<c:remove var="succ" scope="session" />
		</c:if>

	</h4>
	<div class="container">
		<div class="row">
			<div class="offset-md-1">
				<div class="card">
					<div class="card-body">

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDtls b = dao.getBookById(id);
						%>
						<form action="../editbooks" method="post">
							<input type="hidden" name="id" value="<%=b.getbId()%>">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="exampleInputPassword1">Book Name*</label> <input
										type="text" class="form-control" name="bname" required="required"
										value="<%=b.getBname()%>" id="exampleInputPassword1">
								</div>
								<div class="form-group col-md-6">
									<label for="exampleInputPassword1">Book Author*</label> <input
										type="text" class="form-control" name="bauthor" required="required"
										value="<%=b.getBauthor()%>" id="exampleInputPassword1">
								</div>
								<div class="form-group col-md-6">
									<label for="exampleInputPassword1">Price*</label> <input
										type="text" class="form-control" name="bprice" required="required"
										value="<%=b.getBprice()%>" id="exampleInputPassword1">
								</div>
								<div class="form-group col-md-6">
									<label for="inputState">Book Status</label> <select
										id="inputState" class="form-control" name="bstatus">
										<%
										if ("Active".equals(b.getBstatus())) {
										%>
										<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>
										<%
										} else {
										%>
										<option value="Inactive">Inactive</option>
										<option value="Active">Active</option>
										<%
										}
										%>
									</select>
								</div>

								<div class="form-group col-md-6">
									<button type="submit"
										class="btn btn-primary offset-md-6 col-md-6">Update</button>
								</div>
								<div class="form-group col-md-6">
									<button type="submit" class="btn btn-danger col-md-6">Back</button>
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
</body>
</html>
