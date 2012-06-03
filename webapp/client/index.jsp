<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="dto_package.UserDTO"%>
<%@page import="dto_package.TicketDTO"%>
<%@page import="dto_package.RoleDTO"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/style.css">

<title>Client</title>
</head>
<body>

<div id="mainview">
<div id="navbar-container">
  
    <h1 id="navbar-content-title" i18n-content="title">My project</h1>
    <% String tab=(String)request.getAttribute("tab");
    if (tab.equals("1")) {%>
	<li class="navbar-item navbar-item-selected" pagename="browser" role="tab">
		<a href="">
			<span>Active Programmers</span>
			
		</a>
	</li>
	<%} else{%>
	<li class="navbar-item" pagename="browser" role="tab">
		<a href="active">
			<span>Active Programmers</span>
			
		</a>
	</li>
	<%} %>
	<%if (tab.equals("2")) {%>
	<li class="navbar-item navbar-item-selected" pagename="browser" role="tab">
		<a href="">	<span>My Active Tickets</span></a>
	</li>
	<%} else{%>
	<li class="navbar-item" pagename="browser" role="tab">
		<a href="myactive">	<span>My Active Tickets</span></a>
	</li>
	<%} %>
	
	
	<%if (tab.equals("3")) {%>
	<li class="navbar-item navbar-item-selected" pagename="browser" role="tab">
		<a href="">
			<span>Tickets to verify</span>
		</a>
	</li>
	<%} else{%>
	<li class="navbar-item " pagename="browser" role="tab">
		<a href="verify">
			<span>Tickets to verify</span>
		</a>
	</li>
	<%} %>
	
	<%if (tab.equals("4")) {%>
	<li class="navbar-item navbar-item-selected" pagename="browser" role="tab">
		<a href="">
			<span>Closed Tickets</span>
		</a>
	</li>
	<%} else{%>
	<li class="navbar-item " pagename="browser" role="tab">
		<a href="closed">
			<span>Closed Tickets</span>
		</a>
	</li>
	<%} %>
</div>



<div id="mainview-content">
<div id="page-container">
<%if (tab.equals("1")) {%>
	<h2>All Proggers </h2>
	<table id="one-column-emphasis">
		<thead>
		<tr>
			<th>Username</th><th>Email</th>
		</tr>
		</thead>
		<tbody>
		
		<%
			List<UserDTO> users = (ArrayList<UserDTO>)request.getAttribute("proggers");
			for(UserDTO u : users){
		%>
			<tr>
				<td><%=u.username %></td>
				<td><%=u.email %></td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<%} %>
	<%if (tab.equals("2")) {%>
	</table>
	<br>
		<h2>My tickets</h2>
		<h3>Add New Ticket</h3>
		<form action="newticket">
		Summary: <input type="text" name="ticket">
		Description:<input type="text" name="comment">
		Priority:<input type="text" name="point" value="0">
				  <button>Add Ticket</button>
	</form>
		<table id="one-column-emphasis">
		<thead>
		<tr>
			<th>#</th><th>Summary</th><th>Status</th><th>Priority</th><th></th><th></th>
		</tr>
		</thead>
		<tbody>
		<%
			List<TicketDTO> tickets = (ArrayList<TicketDTO>)request.getAttribute("my_tickets");
			for(TicketDTO t : tickets){
				if (!t.status.equals("Resolved")){
		%>
			<tr>
				<td><%=t.ticketId %></td>
				<td><a href="/helpdesk/extra?ticket_id=<%=t.ticketId%>"><%=t.desc %></a></td>
				<td><%=t.status %></td>
				<td><%=t.point %></td>
				<td><button>Edit</button></td>
			</tr>
		<%} }%>
		</tbody>
	</table>
	<%} %>
	<%if (tab.equals("3")) {%>
	<h2>Tickets to verify</h2>
	<table id="one-column-emphasis">
		<thead>
		<tr>
			<th>#</th><th>Summary</th><th>Status</th><th>Priority</th><th></th><th></th>
		</tr>
		</thead>
		<tbody>
		<%
		List<TicketDTO> tickets = (ArrayList<TicketDTO>)request.getAttribute("my_tickets");
			for(TicketDTO t : tickets){
				if (t.status.equals("Resolved")){
		%>
			<tr>
				<td><%=t.ticketId %></td>
				<td><a href="/helpdesk/extra?ticket_id=<%=t.ticketId%>"><%=t.desc %></a></td>
				<td><%=t.status %></td>
				<td><%=t.point %></td>
				<td><a href="close?ticket_id=<%=t.ticketId %>"><button>Close</button></a></td>
				<td><a href="reopen?ticket_id=<%=t.ticketId %>"><button>Reopen</button></a></td>
			</tr>
		<%} }%>
		</tbody>
	</table>
	<%} %>
	<%if (tab.equals("4")) {%>
	<h2>Closed Tickets</h2>
	<table id="one-column-emphasis">
		<thead>
		<tr>
			<th>#</th><th>Summary</th><th>Status</th><th>Priority</th><th></th><th></th>
		</tr>
		</thead>
		<tbody>
		<%
		List<TicketDTO> tickets = (ArrayList<TicketDTO>)request.getAttribute("all_tickets");
			for(TicketDTO t : tickets){
				if (t.status.equals("Closed")){
		%>
			<tr>
				<td><%=t.ticketId %></td>
				<td><a href="/helpdesk/extra?ticket_id=<%=t.ticketId%>"><%=t.desc %></a></td>
				<td><%=t.status %></td>
				<td><%=t.point %></td>
			</tr>
		<%} }%>
		</tbody>
	</table>
	<%} %>
	
	</div></div></div>
</body>
</html>