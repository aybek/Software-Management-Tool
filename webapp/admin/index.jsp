<%@page import="java.util.ArrayList"%>
<%@page import="dto_package.UserDTO"%>
<%@page import="dto_package.ProjectDTO"%>
<%@page import="dto_package.TicketDTO"%>
<%@page import="dto_package.RoleDTO"%>
<%@page import="java.util.List"%>
<html>
<head>
</head>
<body>
	<h2>Add user</h2>
	<form action="newuser">
		Username: <input type="text" name="username">
		Password: <input type="password" name="password">
		Email: 	  <input type="email" name="email">
				  <button>New User</button>
	</form>
	<br>
	<h2>All users</h2>
	<table border="1">
		<tr>
			<td>User Id</td><td>User Name</td><td>Edit</td><td>Delete</td>
		</tr>
		<%
			List<UserDTO> users = (ArrayList<UserDTO>)request.getAttribute("users");
			for(UserDTO u : users){
		%>
			<tr>
				<td><%=u.usersId %></td>
				<td><%=u.username %></td>
				<td><a href=""><button>Edit</button></a></td>
				<td><a href=""><button>Delete</button></a></td>
			</tr>
		<%} %>
	</table>
	<br>
	<h2>All projects</h2>
	<table border="1">
		<tr>
			<td>Project Id</td><td>Project Name</td><td>Edit</td><td>Delete</td>
		</tr>
		<%
			List<ProjectDTO> projects = (ArrayList<ProjectDTO>)request.getAttribute("projects");
			for(ProjectDTO pp : projects){
		%>
			<tr>
				<td><%=pp.projectId %></td>
				<td><%=pp.projectname %></td>
				<td><a href=""><button>Edit</button></a></td>
				<td><a href=""><button>Delete</button></a></td>
			</tr>
		<%} %>
	</table>
	<br>
	<h2>All tickets</h2>
		<table border="1">
		<tr>
			<td>Ticket Id</td><td>Ticket description</td><td>Status</td>
		</tr>
		<%
			List<TicketDTO> tickets = (ArrayList<TicketDTO>)request.getAttribute("tickets");
			for(TicketDTO t : tickets){
		%>
			<tr>
				<td><%=t.ticketId %></td>
				<td><%=t.desc %></td>
				<td><%=t.status %></td>
				<td><a href=""><button>Edit</button></a></td>
				<td><a href=""><button>Delete</button></a></td>
			</tr>
		<%} %>
	</table>
	<br>
	
	<h2>All roles</h2>
	<table border="1">
		<tr>
			<td>Roles</td>
		</tr>
		<%
			List<RoleDTO> roles = (ArrayList<RoleDTO>)request.getAttribute("roles");
			for(RoleDTO t : roles){
		%>
			<tr>
				<td><%=t.role %></td>
				<td><a href=""><button>Edit</button></a></td>
				<td><a href=""><button>Delete</button></a></td>
			</tr>
		<%} %>
	</table>
</body>
</html>