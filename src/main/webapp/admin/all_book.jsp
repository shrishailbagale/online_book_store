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
<title>Admin: All Book</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
@media ( min-width : 576px) {
	.modal-dialog {
		max-width: 400px;
		.
		modal-content
		{
		padding
		:
		1rem;
	}
}

}
.modal-header { .close { margin-top:-1.5rem;
	
}

}
.form-title {
	margin: -2rem 0rem 2rem;
}
</style>
</head>
<body style="background-color: #fcfcfc;">

	<%@include file="navbar.jsp"%>
	<h3 class="text-center p-3 text-primary">
		<b class="text-danger">Admin:</b> All Books
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
							<th scope="col">ID</th>
							<th scope="col">Image</th>
							<th scope="col">Book Name</th>
							<th scope="col">Author</th>
							<th scope="col">Price</th>
							<th scope="col">Category</th>
							<th scope="col">Status</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						List<BookDtls> list = dao.getAllBooks();
						for (BookDtls b : list) {
						%>
						<tr>
							<td><%=b.getbId()%></td>
							<td><img src="../book/<%=b.getBphoto()%> "
								style="width: 40px; height: auto;"></td>
							<td><%=b.getBname()%></td>
							<td><%=b.getBauthor()%></td>
							<td><%=b.getBprice()%></td>
							<td><%=b.getBcategory()%></td>
							<td><%=b.getBstatus()%></td>
							<td><a href="editbook.jsp?id=<%=b.getbId()%>"
								class="btn btn-sm btn-primary" data-target="#loginModal"><i
									class="fa-solid fa-pen-to-square"></i> Edit</a> <!-- popup edit buton --> <%-- <a href="editbook?id=<%=b.getbId()%>" type="button"
								class="btn btn-sm btn-info text-white" data-toggle="modal"
								data-target="#loginModal"><i
									class="fa-solid fa-pen-to-square"></i> Edit</a> --%>
								<div class="modal fade" id="loginModal" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-header border-bottom-0">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<div class="form-title text-center">
													<h4>Update Book</h4>
												</div>
												<div class="d-flex flex-column text-center">

													<form action="../editbooks" method="post">
														<input type="hidden" name="id" value="<%=b.getbId()%>">
														<div class="form-row">
															<div class="form-group col-md-6">
																<label for="exampleInputPassword1">Book Name*</label> <input
																	type="text" class="form-control" name="bname"
																	required="required" value="<%=b.getBname()%>"
																	id="exampleInputPassword1">
															</div>
															<div class="form-group col-md-6">
																<label for="exampleInputPassword1">Book Author*</label>
																<input type="text" class="form-control" name="bauthor"
																	required="required" value="<%=b.getBauthor()%>"
																	id="exampleInputPassword1">
															</div>
															<div class="form-group col-md-6">
																<label for="exampleInputPassword1">Price*</label> <input
																	type="text" class="form-control" name="bprice"
																	required="required" value="<%=b.getBprice()%>"
																	id="exampleInputPassword1">
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
															<div class="form-group col-md-5">
																<button type="submit"
																	class="btn btn-primary offset-md-6 col-md-6">Update</button>
															</div>
															<div class="form-group col-md-5">
																<button type="submit" class="btn btn-danger col-md-6">Back</button>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div> <a href="../delete?id=<%=b.getbId()%>"
								class="btn btn-sm btn-danger"><i
									class="fa-solid fa-trash-can"></i> Delete</a></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>