<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Edit books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="navbar.jsp"%>
	<h3 class="text-center p-3 text-primary">
		<b class="text-danger">Admin:</b> Add Books
	</h3>

	<div class="container">

		<div class="row">
			<div class="offset-md-1">
				<div class="card">
					<div class="card-body">
						<c:if test="${not empty success }">
							<div class="alert alert-success text-center" role="alert">${success }</div>
							<c:remove var="success" scope="session" />
						</c:if>
						<c:if test="${not empty failed }">
							<div class="alert alert-danger text-center" role="alert">${failed}</div>
							<c:remove var="failed" scope="session" />
						</c:if>

						<form action="../add_book" method="post"
							enctype="multipart/form-data">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="exampleInputPassword1">Book Name</label> <input
										type="text" class="form-control" name="bname"
										id="exampleInputPassword1" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="exampleInputPassword1">Book Author</label> <input
										type="text" class="form-control" name="bauthor"
										id="exampleInputPassword1" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="exampleInputPassword1">Price</label> <input
										type="text" class="form-control" name="bprice"
										id="exampleInputPassword1" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputState">Book Category</label> <select
										id="inputState" class="form-control" name="bcategory">
										<option>--select--</option>
										<option selected>New Book</option>
										<option>Old Book</option>
									</select>
								</div>
								<div class="form-group col-md-6">
									<label for="inputState">Book Status</label> <select
										id="inputState" class="form-control" name="bstatus">
										<option value="Active" selected>Active</option>
										<option value="Inactive">Inactive</option>
									</select>
								</div>
								<div class="form-group col-md-6">
									<label for="exampleFormControlFile1">Upload Book image</label>
									<input type="file" class="form-control-file" name="bphoto"
										id="exampleFormControlFile1" required="required">
								</div>
								<button type="submit" class="btn btn-primary col-md-3">Add
									Book</button>
								<div class="form-group col-md-8 h3"></div>
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
	<%@include file="footer.jsp"%>
</body>
</html>
