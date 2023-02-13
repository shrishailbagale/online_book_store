<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.FeedbackDAO"%>
<%@page import="com.entity.Feedback"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>

<body style="background-color: #fcfcfc;">
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="navbar.jsp"%>

	<div class="card">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-striped">
					<h3 class="text-center text-success">All Users Feedback</h3>

					<thead class="bg-primary text-white">
						<tr>
							<th scope="col">No.</th>
							<th scope="col">Name</th>
							<th scope="col">Email</th>
							<th scope="col">Mobile No.</th>
							<th scope="col">User Message</th>
							<!-- <th scope="col">Admin Message</th>
							<th scope="col">Send Mail</th> -->

						</tr>
					</thead>
					<tbody>
						<%
						FeedbackDAO dao2 = new FeedbackDAO(DBConnect.getConn());
						List<Feedback> list2 = dao2.getAllFeedBack();

						for (Feedback e : list2) {
						%>
						<tr>
							<td><%=e.getId()%></td>
							<th scope="row"><%=e.getName()%></th>
							<td><%=e.getEmail()%></td>
							<td><%=e.getPhone()%></td>
							<td><%=e.getMessage()%></td>
							<!-- <td><textarea rows="" cols=""></textarea></td>
							<td><button type="submit" class="btn btn-success ">Send</button>
							</td> -->
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				</table>
			</div>

		</div>
	</div>


</body>
</html>