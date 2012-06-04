<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto_package.UserDTO"%>
<%@page import="dto_package.TicketDTO"%>
<%@page import="dto_package.RoleDTO"%>
<%@page import="dto_package.ProjectDTO"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.*" %>
<%@page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

		<%
    	String lang = (String)request.getAttribute("lang");

		
      	
			Locale locale=null;
			if (lang.equals("Russian")) {
			locale=new Locale("ru","RU");
			} else if (lang.equals("Kazakh")) {
			locale=new Locale("kz","KZ");
			} else {
			locale=Locale.US;
			}
			session.putValue("lang", lang);
			session.putValue("myLocale",locale);
			ResourceBundle bundle = 
				ResourceBundle.getBundle("Message",locale);
			
			for (Enumeration e = bundle.getKeys();e.hasMoreElements();) {
			String key = (String)e.nextElement();
			String s = bundle.getString(key);
			session.putValue(key,s);
			}
		
			%>




<% List<ProjectDTO> projectss = (ArrayList<ProjectDTO>)request.getAttribute("all_projects");int cp=0;
			for(ProjectDTO pro : projectss){cp++;
			String y = (String)session.getAttribute("project");
			if (cp== Integer.parseInt( y )){
			%>
  <title><%=pro.projectname%></title>
			<% }}%>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
  <link href="css/common.css" media="all" rel="stylesheet" type="text/css">
  <link href="css/account.css" media="all" rel="stylesheet" type="text/css">
  <link href="css/print.css" media="print" rel="stylesheet" type="text/css">
  <link href="css/new_ticket.css" media="print" rel="stylesheet" type="text/css">
  <link href="css/page.css" media="all" rel="stylesheet" type="text/css" disabled="">
  <link rel="stylesheet" type="text/css" href="css/simple.css">
  <script src="jquery.js" type="text/javascript"></script>
  
<!--   <script type="text/javascript">

  $(document).ready(function() {
	  $('#new_ticket').hide();
	   $('#button_s').click(function(){
	     $('#new_ticket').show();
	   });
	   $('#cancel_s').click(function(){
		     $('#new_ticket').hide();
		   });
	   
	 });

</script>
 --></head>
  
<body style="" class="">
  <div id="wrapper" style="display: block; " class="theme_blue">
    <div id="header">
     <div id="header_renderer">
      <h1 id="header_title">
      <% List<ProjectDTO> projectc = (ArrayList<ProjectDTO>)request.getAttribute("all_projects");int cy=0;
			for(ProjectDTO prr : projectc){cy++;
			String y = (String)session.getAttribute("project");
			if (cy== Integer.parseInt( y )){
			%>
  	  <a href="#/projects/1"><%=prr.projectname%></a>
			<% }}%>
      	
      </h1>
      <ul id="main_menu">
      <li></li>
      </ul>
      <ul id="lang_menu">
      	<li><a id="sign_out_link" href="enus">eng</a></li>  
      	<li><a id="sign_out_link" href="enru">rus</a></li>
      	<li><a id="sign_out_link" href="enkz">kaz</a></li>
      </ul>
      <ul id="aux_menu">
  				<li id="logged_user"><%=session.getValue("main.hello")%> <a>Aybek</a></li>
      	  
      	<li><a id="sign_out_link" href="logout">Sign Out</a></li>
      </ul>
      <form id="search_form" onsubmit="return false;">
      	<div id="search_box" style="position:relative;">
      		<input type="search" text="search" name="search_query" id="search_query" style="position:relative;z-index:100;width:200px" class="ui-autocomplete-input" autocomplete="off" role="textbox" aria-autocomplete="list" aria-haspopup="true"> 
      	</div>
      </form>
      </div>
      </div>
       
    <div id="sidebar">
    	<div id="sidebar_content">
    	<div>
    		<ul>
    		<%  String tab=(String)request.getAttribute("tab");
    		if (tab.equals("1")) {%>
    			<li class="selected"><a href="overview"><%=session.getValue("main.overview")%></a></li>
    			<%} else{%>
    			<li><a href="overview"><%=session.getValue("main.overview")%></a></li>
    			<%} %>
    		<% if (tab.equals("2")) {%>
    			<li class="selected"><a href="messages"><%=session.getValue("main.messages")%></a></li>
    			<%} else{%>
    			<li><a href="messages"><%=session.getValue("main.messages")%></a></li>
    			<%} %>
    			<% if (tab.equals("3")) {%>
    			<li class="selected"><a href="milestones"><%=session.getValue("main.milestones")%></a></li>
    			<%} else{%>
    			<li><a href="milestones"><%=session.getValue("main.milestones")%></a></li>
    			<%} %>
    			<% if (tab.equals("4")) {%>
    			<li class="selected"><a href="tickets"><%=session.getValue("main.tickets")%></a></li>
    			<%} else{%>
    			<li><a href="tickets"><%=session.getValue("main.tickets")%></a></li>
    			<%} %>
    			<% if (tab.equals("5")) {%>
    			<li class="selected"><a  href="people"><%=session.getValue("main.people")%></a></li>
    			<%} else{%>
    			<li><a href="people"><%=session.getValue("main.people")%></a></li>
    			<%} %>
    			
    			
    			
    			
    		</ul>
    	</div>
    	
    	
    	
    		<div id="context_sensitive">
    			<div class="ticket_status">
    				<!-- <h2>Ticket Status</h2> -->
    				<div class="ie_fixer">
    				<p class="note">Select a project...</p>
    				<form action="ppppp">
    				<select style="width: 100%;" id="ticket_status_ticket_status_project_selector_select" name="formachka" onChange="this.form.submit()">
    				<option value="0">----------</option>
    				<% List<ProjectDTO> projects = (ArrayList<ProjectDTO>)request.getAttribute("all_projects");int cc=0;
			for(ProjectDTO pr : projects){cc++;%>
    					<option value="<%=cc %>"><%=pr.projectname %></option>
    					<%} %>
    				</select>
    				</form>
    				<div id="ticket_status_ticket_status_bar" class="theme_blue">
    				<div class="progress_bar">
    				<div id="ticket_status_ticket_status_bar_progress_div" class="progress_bar_fill" style="width: 0%; "></div></div><table border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr valign="top"><td width="45%" class="note"><div id="ticket_status_ticket_status_bar_actual_hours_div" style="display: none">Hours Spent: <span id="ticket_status_ticket_status_bar_actual_hours">undefined</span></div><div>Closed Tickets: <a id="ticket_status_ticket_status_bar_closed_url" href="#/projects/1/ticket_reports/dynamic?title=Closed+Tickets&amp;conditions_string=status-eq-closed">0</a></div></td><td width="10%" align="center" class="note"><strong id="ticket_status_ticket_status_bar_percent">0%</strong></td><td width="45%" align="right" class="note"><div id="ticket_status_ticket_status_bar_estimated_hours_div" style="display: none">Estimated Hours: <span id="ticket_status_ticket_status_bar_estimated_hours">undefined</span></div><div>Active Tickets: <a id="ticket_status_ticket_status_bar_active_url" href="#/projects/1/ticket_reports/dynamic?title=Active+Tickets&amp;conditions_string=status-neq-closed">1</a></div></td></tr></tbody></table></div></div></div>
    				
    				<hr>
    				<div id="ticket_reports">
			    		<h2>Ticket Reports</h2>
			    		<ul>
			    			<li><a href="active">1. <%=session.getValue("main.active")%></a></li>
			    			<li><a href="resolved">2. <%=session.getValue("main.resolved")%></a></li>
			    			<li><a href="closed">3. <%=session.getValue("main.closed")%></a></li>
			    			<li><a href="myactive">4. <%=session.getValue("main.myactive")%></a></li>
			    			<li><a href="verify">5. <%=session.getValue("main.myresolved")%></a></li>
			    			<li><a href="myclosed">6. <%=session.getValue("main.myclosed")%></a></li>
			    		</ul>
			    	</div>
    			<hr>	
    				<div id="calendar_sidebar"><div class="calendars"><h2></h2><div id="calendars_future"><table class="calendar_mini">  <thead>    <tr class="month_name">      <th colspan="7">June</th>    </tr>    <tr class="day_name">      <th>Sun</th>      <th>Mon</th>      <th>Tue</th>      <th>Wed</th>      <th>Thu</th>      <th>Fri</th>      <th>Sat</th>    </tr>  </thead>  <tbody>    <tr>      <td class="other_month"></td>      <td class="other_month"></td>      <td class="other_month"></td>      <td class="other_month"></td>      <td class="other_month"></td>      <td class="day">1</td>      <td class="day">2</td> </tr>
<tr>      <td class="day">3</td>      <td class="today">4</td>      <td class="day">5</td>      <td class="day">6</td>      <td class="day">7</td>      <td class="day">8</td>      <td class="day">9</td> </tr>
<tr>      <td class="day">10</td>      <td class="day">11</td>      <td class="day">12</td>      <td class="day">13</td>      <td class="day">14</td>      <td class="day">15</td>      <td class="day">16</td> </tr>
<tr>      <td class="day">17</td>      <td class="day">18</td>      <td class="day">19</td>      <td class="day">20</td>      <td class="day">21</td>      <td class="day">22</td>      <td class="day">23</td> </tr>
<tr>      <td class="day">24</td>      <td class="day">25</td>      <td class="day">26</td>      <td class="day">27</td>      <td class="day">28</td>      <td class="day">29</td>      <td class="day">30</td> </tr>
  </tbody>
</table></div></div></div></div></div></div>

    <div id="main">      
      <div id="notice_container"></div>
      <div id="content">
	<%
    if (tab.equals("1")) {%>      
   		   <div id="overview_page"><h1><%=session.getValue("main.overview")%></h1><ul class="menu"><li><a id="message_new_link" href="#">New Message</a></li> <li><a id="milestone_new_link" onclick="return false;" href="#">New Milestone</a></li> <li><a id="ticket_new_link" onclick="return false;" href="#">New Ticket</a></li> <li><a id="person_new_link" onclick="return false;" href="#">Invite a Person</a></li></ul><div id="person_new_dashboard"></div><div id="ticket_new_dashboard"></div><div id="milestone_new_dashboard"></div><div id="message_new_dashboard"></div><div id="newbie_info"><div class="info_wrapper"><p>The Project Overview tab shows you a comprehensive overview of a single project.  This includes recent messages, late and upcoming milestones as well as all recent activity.</p><div class="actions"><a href="#" onclick="Helpers.hideNewbie(); return false;">Hide these messages...</a></div></div></div><div id="activity" class="activity"><div id="column_a"><div class="event_list event_message"><h2>Recent Messages</h2><div id="recent_messages_placeholder"><p>There are no recent messages.</p></div></div></div><div id="column_b"><div class="event_list event_milestone"><h2>Milestones</h2><div id="recent_milestones_placeholder"><div id="milestones_late"></div><div id="milestones_upcoming"></div><div id="no_recent_milestones"><p>There are no upcoming milestones.</p></div></div></div><div id="project_1_upcoming_tickets_holder"></div><div class="event_list recent_activity"><h2>Recent Activity</h2><div id="project_1_recent_activity_placeholder"><div class="row_0 event_ticket "><div class="activity_info"><a href="#/projects/1/tickets/by_number/1">#1: first ticket</a><div class="meta">Created by aybek.bukabayev@gmail.com on <span title="09 May 2012 23:17">09 May 2012</span></div><pre style="color:#666666;font-size:0.9em;font-style: italic;white-space:pre-wrap;">my very first ticket.
			**Priority** Normal. 
			**Project** My First Project. 
			</pre></div></div><div id="older_recent_activity_placeholder"></div><div id="show_older_recent_activity"><span style="float:left;padding:4px 0px 0px 8px;"><a id="show_older_recent_activity_link" href="#" onclick="return false;">Load more...</a></span><span id="show_older_progress" style="float:right;"></span></div></div></div></div></div></div></div>
	<%} %>
	<%if (tab.equals("2")) {%>
	
        
      <div id="message_index">
      <div class="paginator_pages_mini">
      </div>
      <h1><%=session.getValue("main.messages")%></h1>
      <div id="results_counter">
      	<%=session.getValue("main.messages")%> <strong>1</strong> - <strong>1</strong> of <strong>1</strong>
      	</div>
      	<ul class="menu">
      		<li><a href="#" id="new_message_link" onclick="return false;">New Message</a>&nbsp;</li>
      	</ul>
      	<div id="new_message_container">
      	</div>
      	<div id="newbie_info"><div class="info_wrapper"><p>Messages enable you and your team to post status updates, ask questions, and get feedback. Think of messages as a private blog for your project.  Messages can have attachments, such as screenshots or documents. Messages may also be tagged with different categories, allowing you to filter the list of all messages for the project.</p><div class="actions"><a href="#" onclick="Helpers.hideNewbie(); return false;">Hide these messages...</a></div></div></div>
      	<div id="messages_list">
      	<div class="message row_1" id="listed_message_1" style="padding-bottom:20px">
      	<h2 class="title"><a href="#/projects/1/messages/1">say hello</a></h2>
      	<div class="meta">Posted by aybek.bukabayev@gmail.com  on <span title="01 Jun 2012 18:22">01 Jun 2012</span>.
      	</div>
      	<div class="body"><div id="message_body_holder_1">
      	<div class="markdown_formatted"><p>say hello</p></div></div></div></div></div>
      	<div class="paginator_centered"><div class="paginator_pages_mini"></div></div></div>
      
	<%} %>
	<%if (tab.equals("3")) {%>
	       
      <div id="milestone_index"><h1><%=session.getValue("main.milestones")%></h1><ul class="menu"><li>
      <a id="new_milestone_link" href="#">New Milestone</a></li></ul>
      <div id="newbie_info"><div class="info_wrapper"><p>Use milestones to keep track of smaller chunks of your project. Once a milestone has been created, you can create tickets for that specific milestone. You can also assign responsibility for a milestone to a member of the project.</p><p>Once a milestone is completed and no longer being used actively, feel free to archive it so that it no longer appears in dropdowns.</p><div id="newbie_info_link" class="actions"><a href="#" onclick="Helpers.hideNewbie(); return false;">Hide these messages...</a></div></div></div>
      <div id="new_milestone_milestone_index"></div><div id="all_milestones_list"><div id="all_milestones"><div id="column_a"><div id="milestones_upcoming"></div></div><div id="column_b"><div id="milestones_late"><h2>Late Milestones</h2><ul><li id="milestone_1" class="milestone row_0"><div id="milestone_1_render"><div class="milestone_header"><div style="display: block;"><input class="checkbox_complete" id="milestone_1_render_completed" type="checkbox"></div><span class="title"><a title="Show Ticket Report for Milestone" style="color: rgb(0, 0, 0);" href="/a#/projects/1/ticket_reports/dynamic?title=milestone%201 Tickets&amp;conditions_string=milestone-eq-1&amp;group_by=status">milestone 1</a></span></div><div class="meta"><strong><span title="01 Jun 2012 00:00">Friday, 01 Jun 2012</span></strong> - <span style="white-space: nowrap;">aybek.bukabayev@gmail.com is responsible</span><div id="show_milestone_description"><div class="markdown_formatted"><p>first milestone</p></div></div><div id="milestone_1_progress"><div class="progress"><div id="ticket_status_bar_milestone_+1"><div class="progress_bar"><div class="progress_bar_fill" style="width:0%;"></div></div><table border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr valign="top"><td width="45%" class="note"><div>Closed Tickets: <a id="milestone_1_ticket_status_bar_closed_url" href="#/projects/1/ticket_reports/dynamic?conditions_string=status-eq-closed%2Cmilestone-eq-1&amp;project=1&amp;title=Closed+Tickets+for+milestone 1">0</a></div></td><td width="10%" align="center" class="note"><strong>0%</strong></td><td width="45%" align="right" class="note"><div>Active Tickets: <a id="milestone_1_ticket_status_bar_active_url" href="#/projects/1/ticket_reports/dynamic?conditions_string=status-neq-closed%2Cmilestone-eq-1&amp;project=1&amp;title=Active+Tickets+for+milestone 1">2</a></div></td></tr></tbody></table></div></div></div><div class="actions"><a href="#" id="milestone_1_edit_link">Edit</a> <a href="#" id="milestone_1_delete_link"><img alt="Trash" class="trash" src="/images/icons/trash.gif"></a></div></div></div><div style="display: none;" class="object_edit" id="milestone_1_edit"></div></li></ul>
      
      </div><div id="milestones_complete"></div><div id="milestones_archived"></div></div></div></div></div>
	<%} %>
	<%if (tab.equals("4")) {%>
		
			<%String tb=(String)request.getAttribute("tb");int count=0;  if (tb.equals("1")) {
				
			%>
			<%List<TicketDTO> pickets = (ArrayList<TicketDTO>)request.getAttribute("all_tickets");
			for(TicketDTO p : pickets){
				if (!p.status.equals("Resolved")&&!p.status.equals("Closed")){count++;} }%>
			  <div id="report_render">
			  	<h1 style="position: relative;">1. <%=session.getValue("main.active")%><span style="position: absolute; bottom: 2px; right: 0px; font-size: 14px;"><%=count %> <%=session.getValue("main.tickets")%></span></h1>
			  	<ul class="menu"><li><a id="button_s" onclick="$('#newnew').slideToggle(); return false;" href="newticket">New Ticket</a></li></ul>
			  	<div id="newbie_info"><div class="info_wrapper"><p>Use tickets to keep track of bugs, feature requests, or future enhancements for your project. Tickets are a fundamental tool for prioritizing and managing ownership of tasks on your project.</p><p>For more advanced progress reports, look into time tracking.  You can easily keep track of how many hours you have spent on different tickets, milestones and projects.  Never be in the dark about the health of your project again!</p><div class="actions"><a href="#" onclick="Helpers.hideNewbie(); return false;">Hide these messages...</a></div></div></div>
			  	
			  	<div id="newnew" class="new_object object_edit" style="display:none;">		
					<form action="addticket">
						<h2>New Ticket</h2>
						<div class="label">Short Summary:</div>
						<div><input type="text" value="" tabindex="1" size="30" name="ticket[summary]" id="new_ticket_summary" class="title"></div>
						<div class="label">Full Description:</div>
						<textarea id="new_ticket_description" class="markup_textarea markup_textarea markItUpEditor" name="ticket[desc]" style="width:100%" tabindex="2"></textarea>
						<table class="invisible dynamic_info_table" style="width: 100%;">
						<tbody>
						<tr valign="top"><td width="50%">
						<table class="invisible" style="width: 100%; margin-top: 20px;">
						<tbody><tr><td width="40%" class="label" align="right">Priority:</td><td width="60%"><select tabindex="3" style="width: 100%;" name="ticket_1[priority]" id="new_ticket_project_ticket_meta_1_new_priority"><option value="5">Highest</option><option value="4">High</option><option value="3" selected="selected">Normal</option><option value="2">Low</option><option value="1">Lowest</option></select></td></tr></tbody></table></td><td width="50%"><table class="invisible" style="width: 100%; margin-top: 20px;"><tbody><tr><td width="40%" class="label" align="right">Assign To:</td><td width="60%"><select tabindex="10" style="width: 100%;" name="ticket_1[assignee_id]" id="new_ticket_project_ticket_meta_1_new_assignee"><option value="none">&lt;unassigned&gt;</option><option value="1">Me (aybek.bukabayev@gmail.com)</option></select></td></tr><tr><td class="label" align="right">Milestone:</td><td><select tabindex="11" style="width: 100%;" name="ticket_1[milestone_id]" id="new_ticket_project_ticket_meta_1_new_milestone"><option value="none">&lt;none&gt;</option></select></td></tr><tr><td class="label" align="right"></td></tr><tr><td></td><td><input type="submit" value="Create Ticket" tabindex="14" name="commit" id="new_ticket_submit" style="align:right;"> or <a id="cancel_s" onclick="$('#newnew').slideToggle(); return false;" tabindex="15" style="align:right;"  href="">Cancel</a></td></tr></tr></tbody></table></td></tr></tbody></table>
						
					</form>
				</div>
			  	
						
			  	<div class="report_container">
			  		<div class="report_table_wrapper">
			  			<table id="tickets_report_table" class="pretty" width="100%" style="border:0;">
			  				<tbody>
			  					<tr><td width="5%" class="no_print" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="7%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="41%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td></tr>
			  					<tr class="report_header"><td colspan="6"><table class="invisible" width="100%"><tbody><tr><td><h2><none></none></h2></td><td class="ticket_count"><h2><%=count %>  Tickets</h2></td></tr></tbody></table></td></tr>
			  					
			  					<tr class="report_table"><th class="no_print"></th><th style="white-space: nowrap;" class="field_heading_number"><a href="#" onclick="return false"># </a></th><th style="white-space: nowrap;" class="field_heading_summary"><a href="#" onclick="return false">Summary </a></th><th style="white-space: nowrap;" class="field_heading_milestone"><a href="#" onclick="return false">Milestone </a></th><th style="white-space: nowrap;" class="field_heading_assignee"><a href="#" onclick="return false">Assignee </a></th><th style="white-space: nowrap;" class="field_heading_status"><a href="#" onclick="return false">Status </a></th></tr>
						  				<%
						 List<TicketDTO> tickets = (ArrayList<TicketDTO>)request.getAttribute("all_tickets");
						for(TicketDTO t : tickets){
							if (!t.status.equals("Resolved")&&!t.status.equals("Closed")){
							%>
			  					<tr class="row_0 priority_normal hover_effect">
			  					<td class="no_print">
			  						<input type="checkbox" value="1" name="ticket_select_1" id="ticket_select_1" class="ticket_select">
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.ticketId %></a>
			  					</td>
			  					<td style="white-space: normal !important;" onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.desc %></a>
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);">&lt;none&gt;</a>
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.workerId %></a>
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.status %></a>
			  					</td>
			  					</tr>
			  			<%} }%>
			  				</tbody>
			  				</table>
			  		</div>
			  	</div>
			  </div>
			 <%} %>
			 <%  if (tb.equals("2")) {%>
			 <%List<TicketDTO> pickets = (ArrayList<TicketDTO>)request.getAttribute("all_tickets");count=0;
			for(TicketDTO p : pickets){
				if (p.status.equals("Resolved")){count++;} }%>
			  <div id="report_render">
			  	<h1 style="position: relative;">2. <%=session.getValue("main.resolved")%><span style="position: absolute; bottom: 2px; right: 0px; font-size: 14px;"><%=count %> Tickets</span></h1>
			  	<ul class="menu"><li><a id="button_s" onclick="$('#newnew').slideToggle(); return false;" href="newticket">New Ticket</a></li></ul>
			  	
			  	
			  	<div id="newnew" class="new_object object_edit" style="display:none;">		
					<form action="addticket">
						<h2>New Ticket</h2>
						<div class="label">Short Summary:</div>
						<div><input type="text" value="" tabindex="1" size="30" name="ticket[summary]" id="new_ticket_summary" class="title"></div>
						<div class="label">Full Description:</div>
						<textarea id="new_ticket_description" class="markup_textarea markup_textarea markItUpEditor" name="ticket[desc]" style="width:100%" tabindex="2"></textarea>
						<table class="invisible dynamic_info_table" style="width: 100%;">
						<tbody>
						<tr valign="top"><td width="50%">
						<table class="invisible" style="width: 100%; margin-top: 20px;">
						<tbody><tr><td width="40%" class="label" align="right">Priority:</td><td width="60%"><select tabindex="3" style="width: 100%;" name="ticket_1[priority]" id="new_ticket_project_ticket_meta_1_new_priority"><option value="5">Highest</option><option value="4">High</option><option value="3" selected="selected">Normal</option><option value="2">Low</option><option value="1">Lowest</option></select></td></tr></tbody></table></td><td width="50%"><table class="invisible" style="width: 100%; margin-top: 20px;"><tbody><tr><td width="40%" class="label" align="right">Assign To:</td><td width="60%"><select tabindex="10" style="width: 100%;" name="ticket_1[assignee_id]" id="new_ticket_project_ticket_meta_1_new_assignee"><option value="none">&lt;unassigned&gt;</option><option value="1">Me (aybek.bukabayev@gmail.com)</option></select></td></tr><tr><td class="label" align="right">Milestone:</td><td><select tabindex="11" style="width: 100%;" name="ticket_1[milestone_id]" id="new_ticket_project_ticket_meta_1_new_milestone"><option value="none">&lt;none&gt;</option></select></td></tr><tr><td class="label" align="right"></td></tr><tr><td></td><td><input type="submit" value="Create Ticket" tabindex="14" name="commit" id="new_ticket_submit" style="align:right;"> or <a id="cancel_s" onclick="$('#newnew').slideToggle(); return false;" tabindex="15" style="align:right;"  href="">Cancel</a></td></tr></tr></tbody></table></td></tr></tbody></table>
						
					</form>
				</div>
			  	
			  	<div class="report_container">
			  		<div class="report_table_wrapper">
			  			<table id="tickets_report_table" class="pretty" width="100%" style="border:0;">
			  				<tbody>
			  					<tr><td width="5%" class="no_print" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="7%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="41%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td></tr>
			  					<tr class="report_header"><td colspan="6"><table class="invisible" width="100%"><tbody><tr><td><h2><none></none></h2></td><td class="ticket_count"><h2><%=count %>  Tickets</h2></td></tr></tbody></table></td></tr>
			  					
			  					<tr class="report_table"><th class="no_print"></th><th style="white-space: nowrap;" class="field_heading_number"><a href="#" onclick="return false"># </a></th><th style="white-space: nowrap;" class="field_heading_summary"><a href="#" onclick="return false">Summary </a></th><th style="white-space: nowrap;" class="field_heading_milestone"><a href="#" onclick="return false">Milestone </a></th><th style="white-space: nowrap;" class="field_heading_assignee"><a href="#" onclick="return false">Assignee </a></th><th style="white-space: nowrap;" class="field_heading_status"><a href="#" onclick="return false">Status </a></th></tr>
						  				<%
						List<TicketDTO> tickets = (ArrayList<TicketDTO>)request.getAttribute("all_tickets");
						for(TicketDTO t : tickets){
							if (t.status.equals("Resolved")){
							%>
			  					<tr class="row_0 priority_normal hover_effect">
			  					<td class="no_print">
			  						<input type="checkbox" value="1" name="ticket_select_1" id="ticket_select_1" class="ticket_select">
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.ticketId %></a>
			  					</td>
			  					<td style="white-space: normal !important;" onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.desc %></a>
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);">&lt;none&gt;</a>
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.workerId %></a>
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.status %></a>
			  					</td>
			  					</tr>
			  			<%} }%>
			  				</tbody>
			  				</table>
			  		</div>
			  	</div>
			  </div>
			 <%} %>
			 <%  if (tb.equals("3")) {%>
			 <%List<TicketDTO> pickets = (ArrayList<TicketDTO>)request.getAttribute("all_tickets");count=0;
			for(TicketDTO p : pickets){
				if (p.status.equals("Closed")){count++;} }%>
			  <div id="report_render">
			  	<h1 style="position: relative;">3. <%=session.getValue("main.closed")%><span style="position: absolute; bottom: 2px; right: 0px; font-size: 14px;"><%=count %> Tickets</span></h1>
			  	<ul class="menu"><li><a id="button_s" onclick="$('#newnew').slideToggle(); return false;" href="newticket">New Ticket</a></li></ul>
			  	
			  	
			  	<div id="newnew" class="new_object object_edit" style="display:none;">		
					<form action="addticket">
						<h2>New Ticket</h2>
						<div class="label">Short Summary:</div>
						<div><input type="text" value="" tabindex="1" size="30" name="ticket[summary]" id="new_ticket_summary" class="title"></div>
						<div class="label">Full Description:</div>
						<textarea id="new_ticket_description" class="markup_textarea markup_textarea markItUpEditor" name="ticket[desc]" style="width:100%" tabindex="2"></textarea>
						<table class="invisible dynamic_info_table" style="width: 100%;">
						<tbody>
						<tr valign="top"><td width="50%">
						<table class="invisible" style="width: 100%; margin-top: 20px;">
						<tbody><tr><td width="40%" class="label" align="right">Priority:</td><td width="60%"><select tabindex="3" style="width: 100%;" name="ticket_1[priority]" id="new_ticket_project_ticket_meta_1_new_priority"><option value="5">Highest</option><option value="4">High</option><option value="3" selected="selected">Normal</option><option value="2">Low</option><option value="1">Lowest</option></select></td></tr></tbody></table></td><td width="50%"><table class="invisible" style="width: 100%; margin-top: 20px;"><tbody><tr><td width="40%" class="label" align="right">Assign To:</td><td width="60%"><select tabindex="10" style="width: 100%;" name="ticket_1[assignee_id]" id="new_ticket_project_ticket_meta_1_new_assignee"><option value="none">&lt;unassigned&gt;</option><option value="1">Me (aybek.bukabayev@gmail.com)</option></select></td></tr><tr><td class="label" align="right">Milestone:</td><td><select tabindex="11" style="width: 100%;" name="ticket_1[milestone_id]" id="new_ticket_project_ticket_meta_1_new_milestone"><option value="none">&lt;none&gt;</option></select></td></tr><tr><td class="label" align="right"></td></tr><tr><td></td><td><input type="submit" value="Create Ticket" tabindex="14" name="commit" id="new_ticket_submit" style="align:right;"> or <a id="cancel_s" onclick="$('#newnew').slideToggle(); return false;" tabindex="15" style="align:right;"  href="">Cancel</a></td></tr></tr></tbody></table></td></tr></tbody></table>
						
					</form>
				</div>
			  	
			  	<div class="report_container">
			  		<div class="report_table_wrapper">
			  			<table id="tickets_report_table" class="pretty" width="100%" style="border:0;">
			  				<tbody>
			  					<tr><td width="5%" class="no_print" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="7%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="41%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td></tr>
			  					<tr class="report_header"><td colspan="6"><table class="invisible" width="100%"><tbody><tr><td><h2><none></none></h2></td><td class="ticket_count"><h2><%=count %>  Tickets</h2></td></tr></tbody></table></td></tr>
			  					
			  					<tr class="report_table"><th class="no_print"></th><th style="white-space: nowrap;" class="field_heading_number"><a href="#" onclick="return false"># </a></th><th style="white-space: nowrap;" class="field_heading_summary"><a href="#" onclick="return false">Summary </a></th><th style="white-space: nowrap;" class="field_heading_milestone"><a href="#" onclick="return false">Milestone </a></th><th style="white-space: nowrap;" class="field_heading_assignee"><a href="#" onclick="return false">Assignee </a></th><th style="white-space: nowrap;" class="field_heading_status"><a href="#" onclick="return false">Status </a></th></tr>
						  				<%
						List<TicketDTO> tickets = (ArrayList<TicketDTO>)request.getAttribute("all_tickets");
						for(TicketDTO t : tickets){
							if (t.status.equals("Closed")){
							%>
			  					<tr class="row_0 priority_normal hover_effect">
			  					<td class="no_print">
			  						<input type="checkbox" value="1" name="ticket_select_1" id="ticket_select_1" class="ticket_select">
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.ticketId %></a>
			  					</td>
			  					<td style="white-space: normal !important;" onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.desc %></a>
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);">&lt;none&gt;</a>
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.workerId %></a>
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.status %></a>
			  					</td>
			  					</tr>
			  			<%} }%>
			  				</tbody>
			  				</table>
			  		</div>
			  	</div>
			  </div>
			 <%} %>
			 <%  if (tb.equals("4")) {%>
			 <%List<TicketDTO> pickets = (ArrayList<TicketDTO>)request.getAttribute("my_tickets");count=0;
			for(TicketDTO p : pickets){
				if (!p.status.equals("Resolved")&&!p.status.equals("Closed")){count++;} }%>
			  <div id="report_render">
			  	<h1 style="position: relative;">4. <%=session.getValue("main.myactive")%><span style="position: absolute; bottom: 2px; right: 0px; font-size: 14px;"><%=count %> Tickets</span></h1>
			  	<ul class="menu"><li><a id="button_s" onclick="$('#newnew').slideToggle(); return false;" href="newticket">New Ticket</a></li></ul>
			  	
			  	
			  	<div id="newnew" class="new_object object_edit" style="display:none;">		
					<form action="addticket">
						<h2>New Ticket</h2>
						<div class="label">Short Summary:</div>
						<div><input type="text" value="" tabindex="1" size="30" name="ticket[summary]" id="new_ticket_summary" class="title"></div>
						<div class="label">Full Description:</div>
						<textarea id="new_ticket_description" class="markup_textarea markup_textarea markItUpEditor" name="ticket[desc]" style="width:100%" tabindex="2"></textarea>
						<table class="invisible dynamic_info_table" style="width: 100%;">
						<tbody>
						<tr valign="top"><td width="50%">
						<table class="invisible" style="width: 100%; margin-top: 20px;">
						<tbody><tr><td width="40%" class="label" align="right">Priority:</td><td width="60%"><select tabindex="3" style="width: 100%;" name="ticket_1[priority]" id="new_ticket_project_ticket_meta_1_new_priority"><option value="5">Highest</option><option value="4">High</option><option value="3" selected="selected">Normal</option><option value="2">Low</option><option value="1">Lowest</option></select></td></tr></tbody></table></td><td width="50%"><table class="invisible" style="width: 100%; margin-top: 20px;"><tbody><tr><td width="40%" class="label" align="right">Assign To:</td><td width="60%"><select tabindex="10" style="width: 100%;" name="ticket_1[assignee_id]" id="new_ticket_project_ticket_meta_1_new_assignee"><option value="none">&lt;unassigned&gt;</option><option value="1">Me (aybek.bukabayev@gmail.com)</option></select></td></tr><tr><td class="label" align="right">Milestone:</td><td><select tabindex="11" style="width: 100%;" name="ticket_1[milestone_id]" id="new_ticket_project_ticket_meta_1_new_milestone"><option value="none">&lt;none&gt;</option></select></td></tr><tr><td class="label" align="right"></td></tr><tr><td></td><td><input type="submit" value="Create Ticket" tabindex="14" name="commit" id="new_ticket_submit" style="align:right;"> or <a id="cancel_s" onclick="$('#newnew').slideToggle(); return false;" tabindex="15" style="align:right;"  href="">Cancel</a></td></tr></tr></tbody></table></td></tr></tbody></table>
						
					</form>
				</div>
			  	
			  	<div class="report_container">
			  		<div class="report_table_wrapper">
			  			<table id="tickets_report_table" class="pretty" width="100%" style="border:0;">
			  				<tbody>
			  					<tr><td width="5%" class="no_print" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="7%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="41%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td></tr>
			  					<tr class="report_header"><td colspan="6"><table class="invisible" width="100%"><tbody><tr><td><h2><none></none></h2></td><td class="ticket_count"><h2><%=count %>  Tickets</h2></td></tr></tbody></table></td></tr>
			  					
			  					<tr class="report_table"><th class="no_print"></th><th style="white-space: nowrap;" class="field_heading_number"><a href="#" onclick="return false"># </a></th><th style="white-space: nowrap;" class="field_heading_summary"><a href="#" onclick="return false">Summary </a></th><th style="white-space: nowrap;" class="field_heading_milestone"><a href="#" onclick="return false">Milestone </a></th><th style="white-space: nowrap;" class="field_heading_assignee"><a href="#" onclick="return false">Assignee </a></th><th style="white-space: nowrap;" class="field_heading_status"><a href="#" onclick="return false">Status </a></th></tr>
						  				<%
						List<TicketDTO> tickets = (ArrayList<TicketDTO>)request.getAttribute("my_tickets");
						for(TicketDTO t : tickets){
							if (!t.status.equals("Resolved")&&!t.status.equals("Closed")){
							%>
			  					<tr class="row_0 priority_normal hover_effect">
			  					<td class="no_print">
			  						<input type="checkbox" value="1" name="ticket_select_1" id="ticket_select_1" class="ticket_select">
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.ticketId %></a>
			  					</td>
			  					<td style="white-space: normal !important;" onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.desc %></a>
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);">&lt;none&gt;</a>
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.workerId %></a>
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.status %></a>
			  					</td>
			  					</tr>
			  			<%} }%>
			  				</tbody>
			  				</table>
			  		</div>
			  	</div>
			  </div>
			 <%} %>
			 <%  if (tb.equals("5")) {%>
			 <%List<TicketDTO> pickets = (ArrayList<TicketDTO>)request.getAttribute("my_tickets");count=0;
			for(TicketDTO p : pickets){
				if (p.status.equals("Resolved")){count++;} }%>
			  <div id="report_render">
			  	<h1 style="position: relative;">5. <%=session.getValue("main.myresolved")%><span style="position: absolute; bottom: 2px; right: 0px; font-size: 14px;"><%=count %> Tickets</span></h1>
			  	<ul class="menu"><li><a id="button_s" onclick="$('#newnew').slideToggle(); return false;" href="newticket">New Ticket</a></li></ul>
			  	
			  	
			  	<div id="newnew" class="new_object object_edit" style="display:none;">		
					<form action="addticket">
						<h2>New Ticket</h2>
						<div class="label">Short Summary:</div>
						<div><input type="text" value="" tabindex="1" size="30" name="ticket[summary]" id="new_ticket_summary" class="title"></div>
						<div class="label">Full Description:</div>
						<textarea id="new_ticket_description" class="markup_textarea markup_textarea markItUpEditor" name="ticket[desc]" style="width:100%" tabindex="2"></textarea>
						<table class="invisible dynamic_info_table" style="width: 100%;">
						<tbody>
						<tr valign="top"><td width="50%">
						<table class="invisible" style="width: 100%; margin-top: 20px;">
						<tbody><tr><td width="40%" class="label" align="right">Priority:</td><td width="60%"><select tabindex="3" style="width: 100%;" name="ticket_1[priority]" id="new_ticket_project_ticket_meta_1_new_priority"><option value="5">Highest</option><option value="4">High</option><option value="3" selected="selected">Normal</option><option value="2">Low</option><option value="1">Lowest</option></select></td></tr></tbody></table></td><td width="50%"><table class="invisible" style="width: 100%; margin-top: 20px;"><tbody><tr><td width="40%" class="label" align="right">Assign To:</td><td width="60%"><select tabindex="10" style="width: 100%;" name="ticket_1[assignee_id]" id="new_ticket_project_ticket_meta_1_new_assignee"><option value="none">&lt;unassigned&gt;</option><option value="1">Me (aybek.bukabayev@gmail.com)</option></select></td></tr><tr><td class="label" align="right">Milestone:</td><td><select tabindex="11" style="width: 100%;" name="ticket_1[milestone_id]" id="new_ticket_project_ticket_meta_1_new_milestone"><option value="none">&lt;none&gt;</option></select></td></tr><tr><td class="label" align="right"></td></tr><tr><td></td><td><input type="submit" value="Create Ticket" tabindex="14" name="commit" id="new_ticket_submit" style="align:right;"> or <a id="cancel_s" onclick="$('#newnew').slideToggle(); return false;" tabindex="15" style="align:right;"  href="">Cancel</a></td></tr></tr></tbody></table></td></tr></tbody></table>
						
					</form>
				</div>
			  	
			  	<div class="report_container">
			  		<div class="report_table_wrapper">
			  			<table id="tickets_report_table" class="pretty" width="100%" style="border:0;">
			  				<tbody>
			  					<tr><td width="5%" class="no_print" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="7%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="41%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td></tr>
			  					<tr class="report_header"><td colspan="6"><table class="invisible" width="100%"><tbody><tr><td><h2><none></none></h2></td><td class="ticket_count"><h2><%=count %>  Tickets</h2></td></tr></tbody></table></td></tr>
			  					
			  					<tr class="report_table"><th class="no_print"></th><th style="white-space: nowrap;" class="field_heading_number"><a href="#" onclick="return false"># </a></th><th style="white-space: nowrap;" class="field_heading_summary"><a href="#" onclick="return false">Summary </a></th><th style="white-space: nowrap;" class="field_heading_milestone"><a href="#" onclick="return false">Milestone </a></th><th style="white-space: nowrap;" class="field_heading_assignee"><a href="#" onclick="return false">Assignee </a></th><th style="white-space: nowrap;" class="field_heading_status"><a href="#" onclick="return false">Status </a></th></tr>
						  				<%
						List<TicketDTO> tickets = (ArrayList<TicketDTO>)request.getAttribute("my_tickets");
						for(TicketDTO t : tickets){
							if (t.status.equals("Resolved")){
							%>
			  					<tr class="row_0 priority_normal hover_effect">
			  					<td class="no_print">
			  						<input type="checkbox" value="1" name="ticket_select_1" id="ticket_select_1" class="ticket_select">
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.ticketId %></a>
			  					</td>
			  					<td style="white-space: normal !important;" onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.desc %></a>
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);">&lt;none&gt;</a>
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.workerId %></a>
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.status %></a>
			  					</td>
			  					</tr>
			  			<%} }%>
			  				</tbody>
			  				</table>
			  		</div>
			  	</div>
			  </div>
			 <%} %>
			 <% if (tb.equals("6")) {%>
			 <%List<TicketDTO> pickets = (ArrayList<TicketDTO>)request.getAttribute("my_tickets");count=0;
			for(TicketDTO p : pickets){
				if (p.status.equals("Closed")){count++;} }%>
			  <div id="report_render">
			  	<h1 style="position: relative;">6. <%=session.getValue("main.myclosed")%><span style="position: absolute; bottom: 2px; right: 0px; font-size: 14px;"><%=count %> Tickets</span></h1>
			  	<ul class="menu"><li><a id="button_s" onclick="$('#newnew').slideToggle(); return false;" href="newticket">New Ticket</a></li></ul>
			  	
			  	
			  	<div id="newnew" class="new_object object_edit" style="display:none;">		
					<form action="addticket">
						<h2>New Ticket</h2>
						<div class="label">Short Summary:</div>
						<div><input type="text" value="" tabindex="1" size="30" name="ticket[summary]" id="new_ticket_summary" class="title"></div>
						<div class="label">Full Description:</div>
						<textarea id="new_ticket_description" class="markup_textarea markup_textarea markItUpEditor" name="ticket[desc]" style="width:100%" tabindex="2"></textarea>
						<table class="invisible dynamic_info_table" style="width: 100%;">
						<tbody>
						<tr valign="top"><td width="50%">
						<table class="invisible" style="width: 100%; margin-top: 20px;">
						<tbody><tr><td width="40%" class="label" align="right">Priority:</td><td width="60%"><select tabindex="3" style="width: 100%;" name="ticket_1[priority]" id="new_ticket_project_ticket_meta_1_new_priority"><option value="5">Highest</option><option value="4">High</option><option value="3" selected="selected">Normal</option><option value="2">Low</option><option value="1">Lowest</option></select></td></tr></tbody></table></td><td width="50%"><table class="invisible" style="width: 100%; margin-top: 20px;"><tbody><tr><td width="40%" class="label" align="right">Assign To:</td><td width="60%"><select tabindex="10" style="width: 100%;" name="ticket_1[assignee_id]" id="new_ticket_project_ticket_meta_1_new_assignee"><option value="none">&lt;unassigned&gt;</option><option value="1">Me (aybek.bukabayev@gmail.com)</option></select></td></tr><tr><td class="label" align="right">Milestone:</td><td><select tabindex="11" style="width: 100%;" name="ticket_1[milestone_id]" id="new_ticket_project_ticket_meta_1_new_milestone"><option value="none">&lt;none&gt;</option></select></td></tr><tr><td class="label" align="right"></td></tr><tr><td></td><td><input type="submit" value="Create Ticket" tabindex="14" name="commit" id="new_ticket_submit" style="align:right;"> or <a id="cancel_s" onclick="$('#newnew').slideToggle(); return false;" tabindex="15" style="align:right;"  href="">Cancel</a></td></tr></tr></tbody></table></td></tr></tbody></table>
						
					</form>
				</div>
			  	
			  	<div class="report_container">
			  		<div class="report_table_wrapper">
			  			<table id="tickets_report_table" class="pretty" width="100%" style="border:0;">
			  				<tbody>
			  					<tr><td width="5%" class="no_print" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="7%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="41%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td></tr>
			  					<tr class="report_header"><td colspan="6"><table class="invisible" width="100%"><tbody><tr><td><h2><none></none></h2></td><td class="ticket_count"><h2><%=count %>  Tickets</h2></td></tr></tbody></table></td></tr>
			  					
			  					<tr class="report_table"><th class="no_print"></th><th style="white-space: nowrap;" class="field_heading_number"><a href="#" onclick="return false"># </a></th><th style="white-space: nowrap;" class="field_heading_summary"><a href="#" onclick="return false">Summary </a></th><th style="white-space: nowrap;" class="field_heading_milestone"><a href="#" onclick="return false">Milestone </a></th><th style="white-space: nowrap;" class="field_heading_assignee"><a href="#" onclick="return false">Assignee </a></th><th style="white-space: nowrap;" class="field_heading_status"><a href="#" onclick="return false">Status </a></th></tr>
						  				<%
						List<TicketDTO> tickets = (ArrayList<TicketDTO>)request.getAttribute("my_tickets");
						for(TicketDTO t : tickets){
							if (t.status.equals("Closed")){
							%>
			  					<tr class="row_0 priority_normal hover_effect">
			  					<td class="no_print">
			  						<input type="checkbox" value="1" name="ticket_select_1" id="ticket_select_1" class="ticket_select">
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.ticketId %></a>
			  					</td>
			  					<td style="white-space: normal !important;" onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.desc %></a>
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);">&lt;none&gt;</a>
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.workerId %></a>
			  					</td>
			  					<td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')">
			  						<a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);"><%=t.status %></a>
			  					</td>
			  					</tr>
			  			<%} }%>
			  				</tbody>
			  				</table>
			  		</div>
			  	</div>
			  </div>
			 <%} %>
			 
	<%} %>
	<%if (tab.equals("5")) {%>
	
        
      <div id="person_index"><h1><%=session.getValue("main.people")%></h1><ul class="menu"><li><a href="#" id="invite_person_link" onclick="return false;">Invite a Person</a></li></ul><div id="invite_person_people_index"></div>
      <div id="newbie_info"><div class="info_wrapper"><p>The People tab shows you a list of all people associated with this account across all projects. This shows their last login time, as well as the number of projects in which they are involved.</p><p>To invite new people into your projects, click on the "Invite Person" link above and enter the information for that person.  A welcome email will automatically be sent to the person.</p><div class="actions"><a href="#" onclick="Helpers.hideNewbie(); return false;">Hide these messages...</a></div></div></div>
      <div id="people_list" class="people_list_project people_list"><table class="invisible" style="width: 100%;"><tbody><tr valign="top"><td width="50%" class="project_current_people"><h3>Currently Involved People</h3><div id="people_list_project_1_person_1"><div id="people_list_project_1_person_1_title" class="person administrator"><form id="people_list_project_1_person_1_form" onsubmit="return false;"><div id="people_list_project_1_person_1_container"><h3>aybek.bukabayev@gmail.com<span class="username"> (aybek)</span></h3><div class="last_signed_in">Last signed in  at <span title="03 Jun 2012 16:08">4:08pm</span></div><div><a href="mailto:aybek.bukabayev@gmail.com">aybek.bukabayev@gmail.com</a><div class="actions" id="people_list_project_1_person_1_container_actions"><a class="edit_person_link" id="edit_person_1" href="https://aybek.unfuddle.com/a#/people/1">Edit</a> <a class="edit_permissions_link" id="people_list_project_1_person_1_edit_permissions_link" href="#" onclick="return false">Permissions</a> <a class="remove_person_link" id="remove_person_1" href="#" onclick="return false">Remove</a></div></div><div class="admin_label">Account Admin</div><div id="people_list_project_1_person_1_edit_permissions" class="permissions_edit" style="display: none; padding-left: 5px;"></div></div></form></div></div></td><td width="33%" class="project_available_people"><h3>Add Person to a Project</h3><div class="panel"><p style="margin: 0; padding: 5px;">All available people are already involved in this project.</p></div></td></tr></tbody></table></div></div>
	<%} %>
	<%if (tab.equals("6")) {%>
	
	<%} %>
    </div>
    
    
  </div>
  <iframe id="remoting_iframe" name="remoting_iframe" style="width: 1px; height: 1px; border: 0px; display: inline; " src="javascript:false;"></iframe>
<ul class="ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all" role="listbox" aria-activedescendant="ui-active-menuitem" style="z-index: 101; top: 0px; left: 0px; display: none; "></ul>
 </body>
</html>
