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
<title>Progger</title>
</head>
<body>
<div id="mainview">
<div id="navbar-container">
  
    <h1 id="navbar-content-title" i18n-content="title">My project</h1>
    <% String tab=(String)request.getAttribute("tab");
    if (tab.equals("1")) {%>
	<li class="navbar-item navbar-item-selected" pagename="browser" role="tab">
		<a href="">
			<span>Active Tickets</span>
			
		</a>
	</li>
	<%} else{%>
	<li class="navbar-item" pagename="browser" role="tab">
		<a href="active">
			<span>Active Tickets</span>
			
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
			<span>Tickets to be verified</span>
		</a>
	</li>
	<%} else{%>
	<li class="navbar-item " pagename="browser" role="tab">
		<a href="verify">
			<span>Tickets to be verified</span>
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
	<% if (tab.equals("1")) {%>
		<h2>All available tickets</h2>
		<table id="one-column-emphasis">
		<thead>
		<tr>
			<th>#</th><th>Summary</th><th>status</th><th>priority</th><th></th><th></th>
		</tr>
		</thead>
		<tbody>
		<%
			List<TicketDTO> tickets = (ArrayList<TicketDTO>)request.getAttribute("all_tickets");
			for(TicketDTO t : tickets){
				if (t.status.equals("New")||t.status.equals("Reopened")){
		%>
			<tr>
				<td><%=t.ticketId %></td>
				<td><a href="/helpdesk/extra?ticket_id=<%=t.ticketId%>"><%=t.desc %></a></td>
				<td><%=t.status %></td>
				<td><%=t.point %></td>
				<td><a href="accept?ticket_id=<%=t.ticketId %>"><button>Accept</button></a></td>
			</tr>
			</tbody>
		<%} }%>
	</table>
	<%} %>
	
	<% if (tab.equals("2")) {%>
		<h2>My tickets to do</h2>
		<table id="one-column-emphasis">
		<thead>
		<tr>
			<th>#</th><th>Summary</th><th>status</th><th>priority</th><th></th><th></th>
		</tr>
		</thead>
		<tbody>
		<% 
			List<TicketDTO> my_tickets = (ArrayList<TicketDTO>)request.getAttribute("my_tickets");
			for(TicketDTO t : my_tickets){
				if (t.status.equals("Accepted")){
		%>
			<tr>
				<td><%=t.ticketId %></td>
				<td><a href="/helpdesk/extra?ticket_id=<%=t.ticketId%>"><%=t.desc %></a></td>
				<td><%=t.status %></td>
				<td><%=t.point %></td>
				<td><a href="resolve?ticket_id=<%=t.ticketId %>"><button>Resolve</button></a></td>
				<td><a href="unaccept?ticket_id=<%=t.ticketId %>"><button>Unaccept</button></a></td>
			</tr>
			</tbody>
		<%} }%>
	</table>
	<%} %>
	<% if (tab.equals("3")) {%>
	<h2>My resolved tickets</h2>
	<table id="one-column-emphasis">
	
	<thead>
		<tr>
			<th>#</th><th>Summary</th><th>status</th><th>priority</th><th></th><th></th>
		</tr>
		</thead>
		<tbody>
		<%
		List<TicketDTO> my_tickets = (ArrayList<TicketDTO>)request.getAttribute("my_tickets");
			for(TicketDTO t : my_tickets){
				if (t.status.equals("Resolved")){
		%>
			<tr>
				<td><%=t.ticketId %></td>
				<td><a href="/helpdesk/extra?ticket_id=<%=t.ticketId%>"><%=t.desc %></a></td>
				<td><%=t.comment %></td>
				<td><%=t.status %></td>
				<td><%=t.point %></td>
				<td><button>Edit</button></td>
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
	</div>
</div>
</div>
</body>
</html>