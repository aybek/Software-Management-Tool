<%@page import="java.util.ArrayList"%>
<%@page import="dto_package.DeptDTO"%>
<%@page import="java.util.List"%>
<html>
<head></head>

<body>
	<form action="create_dept" method="post">
	<input type="text" name="dept_name">
	<input type="submit" value="Save">
	</form><br>
	<table>
		<%
			List<DeptDTO> depts = (ArrayList<DeptDTO>)request.getAttribute("depts");
			for(DeptDTO d : depts){
		%>
		<tr>
			<td><%=d.deptName %></td>
			<td><a href="dept_edit?dept_id=<%=d.deptId %>"><button>Edit</button></a></td>
			<td><a href="dept_del?dept_id=<%=d.deptId %>"><button>Delete</button></a></td>
		</tr>
		<%} %>
	</table>

</body>
</html>