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
    			<li><a href="#/projects/1">Overview</a></li>
    			<li><a href="#/projects/1">Messages</a></li>
    			<li><a href="#/projects/1">Milestones</a></li>
    			<li><a href="#/projects/1">Tickets</a></li>
    			<li><a href="#/projects/1">People</a></li>
    			
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
      <div id="overview_page"><h1>Project Overview</h1><ul class="menu"><li><a id="message_new_link" href="#">New Message</a></li> <li><a id="milestone_new_link" onclick="return false;" href="#">New Milestone</a></li> <li><a id="ticket_new_link" onclick="return false;" href="#">New Ticket</a></li> <li><a id="person_new_link" onclick="return false;" href="#">Invite a Person</a></li></ul><div id="person_new_dashboard"></div><div id="ticket_new_dashboard"></div><div id="milestone_new_dashboard"></div><div id="message_new_dashboard"></div><div id="newbie_info"><div class="info_wrapper"><p>The Project Overview tab shows you a comprehensive overview of a single project.  This includes recent messages, late and upcoming milestones as well as all recent activity.</p><div class="actions"><a href="#" onclick="Helpers.hideNewbie(); return false;">Hide these messages...</a></div></div></div><div id="activity" class="activity"><div id="column_a"><div class="event_list event_message"><h2>Recent Messages</h2><div id="recent_messages_placeholder"><p>There are no recent messages.</p></div></div></div><div id="column_b"><div class="event_list event_milestone"><h2>Milestones</h2><div id="recent_milestones_placeholder"><div id="milestones_late"></div><div id="milestones_upcoming"></div><div id="no_recent_milestones"><p>There are no upcoming milestones.</p></div></div></div><div id="project_1_upcoming_tickets_holder"></div><div class="event_list recent_activity"><h2>Recent Activity</h2><div id="project_1_recent_activity_placeholder"><div class="row_0 event_ticket "><div class="activity_info"><a href="#/projects/1/tickets/by_number/1">#1: first ticket</a><div class="meta">Created by aybek.bukabayev@gmail.com on <span title="09 May 2012 23:17">09 May 2012</span></div><pre style="color:#666666;font-size:0.9em;font-style: italic;white-space:pre-wrap;">my very first ticket.
**Priority** Normal. 
**Project** My First Project. 
</pre></div></div><div id="older_recent_activity_placeholder"></div><div id="show_older_recent_activity"><span style="float:left;padding:4px 0px 0px 8px;"><a id="show_older_recent_activity_link" href="#" onclick="return false;">Load more...</a></span><span id="show_older_progress" style="float:right;"></span></div></div></div></div></div></div></div>
    </div>
  </div>
  <iframe id="remoting_iframe" name="remoting_iframe" style="width: 1px; height: 1px; border: 0px; display: inline; " src="javascript:false;"></iframe>
<ul class="ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all" role="listbox" aria-activedescendant="ui-active-menuitem" style="z-index: 101; top: 0px; left: 0px; display: none; "></ul>
 </body>
</html>