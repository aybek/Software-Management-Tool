package servlet_package;

import interface_package.IUserServicesRemote;
import java.io.IOException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.log4j.Logger;

import dto_package.TicketDTO;
import dto_package.UserDTO;

public class MainServlet extends HttpServlet {
	
/**
	 * 
	 */
	private static final long serialVersionUID = 3558218128774438813L;
	//	@EJB
//	IUserServicesRemote bean;
	private Logger log = Logger.getLogger(getClass());
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		log.info("doGet...");
		try {
			go(req, resp);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.info("doGet done!");
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		log.info("doPost...");
		try {
			go(req, resp);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.info("doPost done!");
	}
	public void go(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, NamingException{
		log.info("GOOO !!");
		String tab="1";
		IUserServicesRemote bean = null;
		InitialContext initContext = new InitialContext();
		
		String path = req.getRequestURI().substring(req.getRequestURI().lastIndexOf("/")+1);
		
		try{
			bean = (IUserServicesRemote)initContext.lookup("helpdesk/UserServicesBean/remote");
		}
		catch(Exception e){
			
		}
		
		if(path.equals("overview")){
			tab="1";
		}
		if(path.equals("messages")){
			tab="2";
		}
		if(path.equals("milestones")){
			tab="3";
		}
		if(path.equals("tickets")){
			tab="4";
		}
		if(path.equals("people")){
			tab="5";
		}
		
		if(path.equals("ticket_info")){
			Long ticket_id = Long.parseLong(req.getParameter("ticket_id"));
			req.setAttribute("ticket", bean.getTicket(ticket_id));
			req.getRequestDispatcher("ticket.jsp").forward(req,resp);
		
		}
		
		if(path.equals("close")){
			Long ticket_id = Long.parseLong(req.getParameter("ticket_id"));
			bean.closeTicket(ticket_id);
//			resp.sendRedirect("hello.html");
			tab="3";
		}
		
		if(path.equals("reopen")){
			Long ticket_id = Long.parseLong(req.getParameter("ticket_id"));
			bean.reopenTicket(ticket_id);
//			resp.sendRedirect("hello.html");
			tab="3";
		}
		
		if(path.equals("newticket")){
			UserDTO me = bean.getMe();
			TicketDTO newticket = new TicketDTO();
			newticket.desc = req.getParameter("ticket");
			newticket.comment = req.getParameter("comment");
			newticket.point = Long.parseLong(req.getParameter("point"));
			newticket.ownerId = me.username;
			bean.createTicket(newticket);
			tab="2";
//			resp.sendRedirect("hello.html");
		}
		
//		if(path.equals("")){
			UserDTO me = bean.getMe();
		req.setAttribute("proggers", bean.getProggers());
		req.setAttribute("all_tickets", bean.getAllTickets());
		req.setAttribute("my_tickets",bean.getMyTickets(me));
		req.setAttribute("tab",tab);
		req.getRequestDispatcher("/index/index.jsp").forward(req, resp);
//		}
	}

}
