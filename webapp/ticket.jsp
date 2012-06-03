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
  
    <h1 id="navbar-content-title" i18n-content="title">Ticket Info</h1>
    </div>



<div id="mainview-content">
<div id="page-container">
<% TicketDTO t = (TicketDTO)request.getAttribute("ticket"); %>
	<p><b>Ticket</b> : <%=t.ticketId %></p>
	<p><b>Summary</b> :<%=t.desc %></p>
	<p><b>Full Description</b> :<%=t.comment %></p>
	<p><b>Status</b> : <%=t.status %></p>
	<p><b>Priority</b> :<%=t.point %></p>
	<p><b>Ticket Owner</b> :<%=t.ownerId %></p>  
	<p><b>Working programmer</b> :<%=t.workerId %></p>
	 
	</div></div></div>
</body>
</html>