<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DAO.UserDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Database</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #fcfcfc;">
	<%@include file="navbar.jsp"%>
	<%-- <c:if test="${not empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
 --%>

	<div class="card p-2">
		<h4 class="text-center text-danger">User Database</h4>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr class="bg-info text-white">
							<th scope="col">sr.</th>
							<th scope="col">Name</th>
							<th scope="col">Email</th>
							<th scope="col">Mobile</th>
							<th scope="col">Password</th>
							<th scope="col">Address</th>							
						</tr>
					</thead>
					<tbody>
						<%
						UserDAOImpl dao1 = new UserDAOImpl(DBConnect.getConn());
						List<User> list = dao1.getAllUser();
						for (User u : list) {
						%>
						<tr>
							<td><%=u.getId()%></td>
							<th><%=u.getName()%></th>
							<td><%=u.getEmail()%></td>
							<td><%=u.getPhone()%></td>
							<td><%=u.getPassword()%></td>
							<td><%=u.getAddress()%>,<%=u.getCity()%>, <%=u.getState()%>,
								<%=u.getPincode()%></td>
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