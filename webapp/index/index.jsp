<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto_package.UserDTO"%>
<%@page import="dto_package.TicketDTO"%>
<%@page import="dto_package.RoleDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <title>My First Project</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
  <link href="css/common.css" media="all" rel="stylesheet" type="text/css">
  <link href="css/account.css" media="all" rel="stylesheet" type="text/css">
  <link href="css/print.css" media="print" rel="stylesheet" type="text/css">
  <link href="css/page.css" media="all" rel="stylesheet" type="text/css" disabled="">
  <link rel="stylesheet" type="text/css" href="css/simple.css">
</head>
  
<body style="" class="">
  <div id="wrapper" style="display: block; " class="theme_blue">
    <div id="header">
     <div id="header_renderer">
      <h1 id="header_title"><a href="#/projects/1">My First Project</a></h1>
      <ul id="main_menu">
      <li></li>
      </ul>
      <ul id="lang_menu">
      	<li><a id="sign_out_link" href="#">eng</a></li>  
      	<li><a id="sign_out_link" href="#">rus</a></li>
      	<li><a id="sign_out_link" href="#">kaz</a></li>
      </ul>
      <ul id="aux_menu">
      	<li id="logged_user">Hello <a>Aybek</a></li>  
      	<li><a id="sign_out_link" href="#">Sign Out</a></li>
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
    			<li><a href="overview">Overview</a></li>
    			<li><a href="messages">Messages</a></li>
    			<li><a href="milestones">Milestones</a></li>
    			<li><a href="tickets">Tickets</a></li>
    			<li><a href="people">People</a></li>
    			
    		</ul>
    	</div>
    		<div id="context_sensitive">
    			<div class="ticket_status">
    				<!-- <h2>Ticket Status</h2> -->
    				<div class="ie_fixer">
    				<p class="note">Select a project...</p>
    				<select style="width: 100%;" id="ticket_status_ticket_status_project_selector_select">
    					<option value="1">My First Project</option>
    				</select>
    				<div id="ticket_status_ticket_status_bar" class="theme_blue">
    				<div class="progress_bar">
    				<div id="ticket_status_ticket_status_bar_progress_div" class="progress_bar_fill" style="width: 0%; "></div></div><table border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr valign="top"><td width="45%" class="note"><div id="ticket_status_ticket_status_bar_actual_hours_div" style="display: none">Hours Spent: <span id="ticket_status_ticket_status_bar_actual_hours">undefined</span></div><div>Closed Tickets: <a id="ticket_status_ticket_status_bar_closed_url" href="#/projects/1/ticket_reports/dynamic?title=Closed+Tickets&amp;conditions_string=status-eq-closed">0</a></div></td><td width="10%" align="center" class="note"><strong id="ticket_status_ticket_status_bar_percent">0%</strong></td><td width="45%" align="right" class="note"><div id="ticket_status_ticket_status_bar_estimated_hours_div" style="display: none">Estimated Hours: <span id="ticket_status_ticket_status_bar_estimated_hours">undefined</span></div><div>Active Tickets: <a id="ticket_status_ticket_status_bar_active_url" href="#/projects/1/ticket_reports/dynamic?title=Active+Tickets&amp;conditions_string=status-neq-closed">1</a></div></td></tr></tbody></table></div></div></div><hr><div id="calendar_sidebar"><div class="calendars"><h2></h2><div id="calendars_future"><table class="calendar_mini">  <thead>    <tr class="month_name">      <th colspan="7">June</th>    </tr>    <tr class="day_name">      <th>Sun</th>      <th>Mon</th>      <th>Tue</th>      <th>Wed</th>      <th>Thu</th>      <th>Fri</th>      <th>Sat</th>    </tr>  </thead>  <tbody>    <tr>      <td class="other_month"></td>      <td class="other_month"></td>      <td class="other_month"></td>      <td class="other_month"></td>      <td class="other_month"></td>      <td class="day">1</td>      <td class="today">2</td> </tr>
<tr>      <td class="day">3</td>      <td class="day">4</td>      <td class="day">5</td>      <td class="day">6</td>      <td class="day">7</td>      <td class="day">8</td>      <td class="day">9</td> </tr>
<tr>      <td class="day">10</td>      <td class="day">11</td>      <td class="day">12</td>      <td class="day">13</td>      <td class="day">14</td>      <td class="day">15</td>      <td class="day">16</td> </tr>
<tr>      <td class="day">17</td>      <td class="day">18</td>      <td class="day">19</td>      <td class="day">20</td>      <td class="day">21</td>      <td class="day">22</td>      <td class="day">23</td> </tr>
<tr>      <td class="day">24</td>      <td class="day">25</td>      <td class="day">26</td>      <td class="day">27</td>      <td class="day">28</td>      <td class="day">29</td>      <td class="day">30</td> </tr>
  </tbody>
</table></div></div></div></div></div></div>

    <div id="main">      
      <div id="notice_container"></div>
      <div id="content">
	<% String tab=(String)request.getAttribute("tab");
    if (tab.equals("1")) {%>      
   		   <div id="overview_page"><h1>Project Overview</h1><ul class="menu"><li><a id="message_new_link" href="#">New Message</a></li> <li><a id="milestone_new_link" onclick="return false;" href="#">New Milestone</a></li> <li><a id="ticket_new_link" onclick="return false;" href="#">New Ticket</a></li> <li><a id="person_new_link" onclick="return false;" href="#">Invite a Person</a></li></ul><div id="person_new_dashboard"></div><div id="ticket_new_dashboard"></div><div id="milestone_new_dashboard"></div><div id="message_new_dashboard"></div><div id="newbie_info"><div class="info_wrapper"><p>The Project Overview tab shows you a comprehensive overview of a single project.  This includes recent messages, late and upcoming milestones as well as all recent activity.</p><div class="actions"><a href="#" onclick="Helpers.hideNewbie(); return false;">Hide these messages...</a></div></div></div><div id="activity" class="activity"><div id="column_a"><div class="event_list event_message"><h2>Recent Messages</h2><div id="recent_messages_placeholder"><p>There are no recent messages.</p></div></div></div><div id="column_b"><div class="event_list event_milestone"><h2>Milestones</h2><div id="recent_milestones_placeholder"><div id="milestones_late"></div><div id="milestones_upcoming"></div><div id="no_recent_milestones"><p>There are no upcoming milestones.</p></div></div></div><div id="project_1_upcoming_tickets_holder"></div><div class="event_list recent_activity"><h2>Recent Activity</h2><div id="project_1_recent_activity_placeholder"><div class="row_0 event_ticket "><div class="activity_info"><a href="#/projects/1/tickets/by_number/1">#1: first ticket</a><div class="meta">Created by aybek.bukabayev@gmail.com on <span title="09 May 2012 23:17">09 May 2012</span></div><pre style="color:#666666;font-size:0.9em;font-style: italic;white-space:pre-wrap;">my very first ticket.
			**Priority** Normal. 
			**Project** My First Project. 
			</pre></div></div><div id="older_recent_activity_placeholder"></div><div id="show_older_recent_activity"><span style="float:left;padding:4px 0px 0px 8px;"><a id="show_older_recent_activity_link" href="#" onclick="return false;">Load more...</a></span><span id="show_older_progress" style="float:right;"></span></div></div></div></div></div></div></div>
	<%} %>
	<%if (tab.equals("2")) {%>
	
        
      <div id="message_index">
      <div class="paginator_pages_mini">
      </div>
      <h1>Messages</h1>
      <div id="results_counter">
      	Messages <strong>1</strong> - <strong>1</strong> of <strong>1</strong>
      	</div>
      	<ul class="menu">
      		<li><a href="#" id="new_message_link" onclick="return false;">New Message</a>&nbsp;</li>
      	</ul>
      	<div id="new_message_container">
      	</div>
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
	       
      <div id="milestone_index"><h1>Milestones</h1><ul class="menu"><li><a id="new_milestone_link" href="#">New Milestone</a></li></ul><div id="new_milestone_milestone_index"></div><div id="all_milestones_list"><div id="all_milestones"><div id="column_a"><div id="milestones_upcoming"></div></div><div id="column_b"><div id="milestones_late"><h2>Late Milestones</h2><ul><li id="milestone_1" class="milestone row_0"><div id="milestone_1_render"><div class="milestone_header"><div style="display: block;"><input class="checkbox_complete" id="milestone_1_render_completed" type="checkbox"></div><span class="title"><a title="Show Ticket Report for Milestone" style="color: rgb(0, 0, 0);" href="/a#/projects/1/ticket_reports/dynamic?title=milestone%201 Tickets&amp;conditions_string=milestone-eq-1&amp;group_by=status">milestone 1</a></span></div><div class="meta"><strong><span title="01 Jun 2012 00:00">Friday, 01 Jun 2012</span></strong> - <span style="white-space: nowrap;">aybek.bukabayev@gmail.com is responsible</span><div id="show_milestone_description"><div class="markdown_formatted"><p>first milestone</p></div></div><div id="milestone_1_progress"><div class="progress"><div id="ticket_status_bar_milestone_+1"><div class="progress_bar"><div class="progress_bar_fill" style="width:0%;"></div></div><table border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr valign="top"><td width="45%" class="note"><div>Closed Tickets: <a id="milestone_1_ticket_status_bar_closed_url" href="#/projects/1/ticket_reports/dynamic?conditions_string=status-eq-closed%2Cmilestone-eq-1&amp;project=1&amp;title=Closed+Tickets+for+milestone 1">0</a></div></td><td width="10%" align="center" class="note"><strong>0%</strong></td><td width="45%" align="right" class="note"><div>Active Tickets: <a id="milestone_1_ticket_status_bar_active_url" href="#/projects/1/ticket_reports/dynamic?conditions_string=status-neq-closed%2Cmilestone-eq-1&amp;project=1&amp;title=Active+Tickets+for+milestone 1">2</a></div></td></tr></tbody></table></div></div></div><div class="actions"><a href="#" id="milestone_1_edit_link">Edit</a> <a href="#" id="milestone_1_delete_link"><img alt="Trash" class="trash" src="/images/icons/trash.gif"></a></div></div></div><div style="display: none;" class="object_edit" id="milestone_1_edit"></div></li></ul></div><div id="milestones_complete"></div><div id="milestones_archived"></div></div></div></div></div>
	<%} %>
	<%if (tab.equals("4")) {%>
	  <div id="report_render">
	  	<h1 style="position: relative;">1. Active Tickets<span style="position: absolute; bottom: 2px; right: 0px; font-size: 14px;">3 Tickets</span></h1>
	  	<ul class="menu"><li><a id="ticket_new_link" onclick="$('#new_ticket').show(); $('#new_ticket_summary').focus();; return false;" href="#">New Ticket</a></li><li><a href="#/projects/1/ticket_reports/dynamic?title=New%20Report&amp;show_options=true&amp;new_report=true">New Report</a></li></ul>
	  	<div class="report_container">
	  		<div class="report_table_wrapper">
	  			<table id="tickets_report_table" class="pretty" width="100%" style="border:0;">
	  				<tbody>
	  					<tr><td width="5%" class="no_print" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="7%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="41%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td><td width="15%" style="height: 0 !important; padding: 0 !important; border: 0 !important;"> </td></tr>
	  					<tr class="report_header"><td colspan="6"><table class="invisible" width="100%"><tbody><tr><td><h2><none></none></h2></td><td class="ticket_count"><h2>3 Tickets</h2></td></tr></tbody></table></td></tr>
	  					
	  					<tr class="report_table"><th class="no_print"></th><th style="white-space: nowrap;" class="field_heading_number"><a href="#" onclick="return false"># </a></th><th style="white-space: nowrap;" class="field_heading_summary"><a href="#" onclick="return false">Summary </a></th><th style="white-space: nowrap;" class="field_heading_milestone"><a href="#" onclick="return false">Milestone </a></th><th style="white-space: nowrap;" class="field_heading_assignee"><a href="#" onclick="return false">Assignee </a></th><th style="white-space: nowrap;" class="field_heading_status"><a href="#" onclick="return false">Status </a></th></tr>
	  					<tr class="row_0 priority_normal hover_effect"><td class="no_print"><input type="checkbox" value="1" name="ticket_select_1" id="ticket_select_1" class="ticket_select"></td><td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')"><a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);">1</a></td><td style="white-space: normal !important;" onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')"><a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);">first ticket</a></td><td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')"><a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);">&lt;none&gt;</a></td><td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')"><a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);">&lt;none&gt;</a></td><td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/1?cycle=true')"><a href="#/projects/1/tickets/by_number/1?cycle=true" onclick="Helpers.event_override(event);">New</a></td></tr>
	  					<tr class="row_1 priority_normal hover_effect"><td class="no_print"><input type="checkbox" value="1" name="ticket_select_2" id="ticket_select_2" class="ticket_select"></td><td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/2?cycle=true')"><a href="#/projects/1/tickets/by_number/2?cycle=true" onclick="Helpers.event_override(event);">2</a></td><td style="white-space: normal !important;" onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/2?cycle=true')"><a href="#/projects/1/tickets/by_number/2?cycle=true" onclick="Helpers.event_override(event);">sdsfsd</a></td><td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/2?cycle=true')"><a href="#/projects/1/tickets/by_number/2?cycle=true" onclick="Helpers.event_override(event);">&lt;none&gt;</a></td><td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/2?cycle=true')"><a href="#/projects/1/tickets/by_number/2?cycle=true" onclick="Helpers.event_override(event);">aybek.bukabayev@gmail.com</a></td><td onclick="UI.Bookmarker.redirectTo('#/projects/1/tickets/by_number/2?cycle=true')"><a href="#/projects/1/tickets/by_number/2?cycle=true" onclick="Helpers.event_override(event);">New</a></td></tr>
	  				</tbody>
	  				</table>
	  		</div>
	  	</div>
	  </div>
	<%} %>
	<%if (tab.equals("5")) {%>
	
        
      <div id="person_index"><h1>People</h1><ul class="menu"><li><a href="#" id="invite_person_link" onclick="return false;">Invite a Person</a></li></ul><div id="invite_person_people_index"></div><div id="people_list" class="people_list_project people_list"><table class="invisible" style="width: 100%;"><tbody><tr valign="top"><td width="50%" class="project_current_people"><h3>Currently Involved People</h3><div id="people_list_project_1_person_1"><div id="people_list_project_1_person_1_title" class="person administrator"><form id="people_list_project_1_person_1_form" onsubmit="return false;"><div id="people_list_project_1_person_1_container"><h3>aybek.bukabayev@gmail.com<span class="username"> (aybek)</span></h3><div class="last_signed_in">Last signed in  at <span title="03 Jun 2012 16:08">4:08pm</span></div><div><a href="mailto:aybek.bukabayev@gmail.com">aybek.bukabayev@gmail.com</a><div class="actions" id="people_list_project_1_person_1_container_actions"><a class="edit_person_link" id="edit_person_1" href="https://aybek.unfuddle.com/a#/people/1">Edit</a> <a class="edit_permissions_link" id="people_list_project_1_person_1_edit_permissions_link" href="#" onclick="return false">Permissions</a> <a class="remove_person_link" id="remove_person_1" href="#" onclick="return false">Remove</a></div></div><div class="admin_label">Account Admin</div><div id="people_list_project_1_person_1_edit_permissions" class="permissions_edit" style="display: none; padding-left: 5px;"></div></div></form></div></div></td><td width="33%" class="project_available_people"><h3>Add Person to a Project</h3><div class="panel"><p style="margin: 0; padding: 5px;">All available people are already involved in this project.</p></div></td></tr></tbody></table></div></div>
	<%} %>
	<%if (tab.equals("6")) {%>
	<%} %>
    </div>
    
    
  </div>
  <iframe id="remoting_iframe" name="remoting_iframe" style="width: 1px; height: 1px; border: 0px; display: inline; " src="javascript:false;"></iframe>
<ul class="ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all" role="listbox" aria-activedescendant="ui-active-menuitem" style="z-index: 101; top: 0px; left: 0px; display: none; "></ul>
 </body>
</html>
