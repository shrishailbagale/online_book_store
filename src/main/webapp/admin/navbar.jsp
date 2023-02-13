<%@ page isELIgnored="false"%>
<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-4 text-danger">
			<h3 class="text-center">
				<i class="fas fa-book"></i> E-Book Management System
			</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search Book name and Author" aria-label="Search"
					style="max-width: 60%; width: 100%;">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">
					<i class="fas fa-search"></i> Search
				</button>
			</form>
		</div>
		<div class="col-md-2">
			<c:if test="${not empty userobj }">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-user"></i> ${userobj.name }</a>
				<a data-toggle="modal" data-target="#exampleModalCenter"
					class="btn btn-danger text-white"><i
					class="fa-solid fa-right-from-bracket"></i> Logout</a>

			</c:if>
			<c:if test="${empty userobj }">
				<a href="../login.jsp" class="btn btn-success"><i
					class="fas fa-sign-in-alt"></i> Login</a>
				<a href="../register.jsp" class="btn btn-primary"><i
					class="fas fa-user-plus"></i> Register</a>
			</c:if>
		</div>
	</div>
</div>
<!-- logout modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<h4>
					Do you want <b>Logout</b>
				</h4>
				<div class="text-center">
					<a type="button" class="btn btn-secondary" data-dismiss="modal">No</a>
					<a href="../logout" type="button" class="btn btn-danger">Yes</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end logout Modal -->


<nav class="navbar navbar-expand-lg navbar-dark "
	style="background-color: #ed143d">
	<a class="navbar-brand" href="home.jsp"><i class="fas fa-home"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp"><b>Home</b>
					<span class="sr-only">(current)</span> </a></li>
			<li class="nav-item active"><a class="nav-link"
				href="add_book.jsp">Add book<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_book.jsp">All book <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="order.jsp">Order
					book<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> More </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Feedback</a> <a
						class="dropdown-item" href="#">About</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="contact.jsp">Contact</a>
				</div></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<button class="btn btn-light my-2 my-sm-0" type="submit">
				<i class="fas fa-cog"></i> Settings
			</button>
			<button class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
				<i class="fas fa-phone-square-alt"></i> Contact Us
			</button>
		</form>
	</div>
</nav>