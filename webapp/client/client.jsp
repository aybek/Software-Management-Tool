<%@page import="java.util.List"%>
<%@page import="dto_package.TasksDTO"%>
<%@page import="dto_package.UserDTO"%>
<html>
<%	UserDTO user = (UserDTO)request.getAttribute("info");
	//List<TasksDTO> userTasks = user.userTasks;

%>
<head>
<title>Client Page</title>
</head>
<body>
	<table border="1">
		<tr>
			<td><%=user.username %></td><td><%=user.password %></td><td><%=user.userType%></td>
		</tr>
	</table>
	<table border="1"><% for(TasksDTO t : user.userTasks){ %>
		<tr>
			<td><%=t.discription %></td><td><%=t.comment%></td>
		</tr>
		<%} %>
	</table>
</body>

</html>