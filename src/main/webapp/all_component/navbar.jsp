<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-4 text-success">
			<h3 class="text-danger">
				<i class="fas fa-book"></i> E-Book Management System
			</h3>
		</div>
		<div class="col-md-4">
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					title="Search Book name and Author " placeholder="Search"
					aria-label="Search" style="max-width: 60%; width: 100%;">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">
					<i class="fas fa-search"></i> Search
				</button>
			</form>
		</div>

		<c:if test="${not empty userobj }">
			<div class="col-md-3">
				<a href="checkout.jsp"><i
					class="fa-solid fa-cart-plus text-primary fa-2x"></i></a> <a
					href="login.jsp" class="btn btn-success"><i class="fas fa-user"></i>
					${userobj.name }</a> <a data-toggle="modal"
					data-target="#exampleModalCenter" href="logoutServlet"
					class="btn btn-danger text-white"><i class="fas fa-user-plus"></i>
					Logout </a>
			</div>
		</c:if>

		<c:if test="${empty userobj }">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"><i
					class="fas fa-sign-in-alt"></i> Login</a> <a href="register.jsp"
					class="btn btn-primary"><i class="fas fa-user-plus"></i>
					Register</a>
			</div>
		</c:if>

	</div>
</div>

<!-- logout modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">message</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<h4>Do you want logout</h4>
				<div class="text-center">
					<a type="button" class="btn btn-secondary" data-dismiss="modal">Close</a>
					<a href="logout" type="button" class="btn btn-danger">LogOut</a>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!-- end logout Modal -->

<nav class="navbar navbar-expand-lg navbar-dark"
	style="background-color: #ed143d">
	<a class="navbar-brand active" href="index.jsp"><i
		class="fas fa-home"></i> <b>Home</b></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto" style="font-size: 18px;">
			<!-- <li class="nav-item active"><a class="nav-link" href="">
					<span class="sr-only">(current)</span> </a></li> -->
			<li class="nav-item active"><a class="nav-link"
				href="all_recent_book.jsp">Recent-book<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_new_book.jsp">New-book <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_old_book.jsp">Old-book<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="feedback.jsp">Feedback<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="about.jsp">About
					Us<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> More </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">About</a> <a
						class="dropdown-item" href="contact.jsp">Contact</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Help</a>
				</div></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0"
				type="submit"> <i class="fas fa-cog"></i> Settings
			</a> <a href="contact.jsp" class="btn btn-light my-2 my-sm-0 ml-1" type="submit"> <i
				class="fas fa-phone-square-alt"></i> Contact Us
			</a>
		</form>
	</div>
</nav>