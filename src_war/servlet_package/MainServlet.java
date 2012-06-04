package servlet_package;

import interface_package.IUserServicesRemote;
import java.io.IOException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


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
	@SuppressWarnings("deprecation")
	public void go(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, NamingException{
		log.info("GOOO !!");
		String tab="1",tb="1",lang=null;
		int proj;
		
		
		HttpSession session = req.getSession(true);
		if (session.getAttribute("project")==null)
		session.setAttribute("project", "1");
		
		lang=(String)session.getValue("lang");
		if (lang==null)lang="English";
		
		IUserServicesRemote bean = null;
		InitialContext initContext = new InitialContext();
		
		String path = req.getRequestURI().substring(req.getRequestURI().lastIndexOf("/")+1);
		
		try{
			bean = (IUserServicesRemote)initContext.lookup("helpdesk/UserServicesBean/remote");
		}
		catch(Exception e){
			
		}
		if(path.equals("ppppp")){
			tab="1";
			
			
			session.setAttribute("project", (String)req.getParameter("formachka"));
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
		
		
		if(path.equals("active")){
			tab="4";
			tb="1";
		}
		if(path.equals("resolved")){
			tab="4";
			tb="2";
		}
		if(path.equals("closed")){
			tab="4";
			tb="3";
		}
		if(path.equals("myactive")){
			tab="4";
			tb="4";
		}
		if(path.equals("verify")){
			tab="4";
			tb="5";
		}
	
		if(path.equals("myclosed")){
			tab="4";
			tb="6";
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
			tab="6";
		}
		
		if(path.equals("enus")){
			lang="English";
		}
		
		if(path.equals("enru")){
			lang="Russian";
		}
		
		if(path.equals("enkz")){
			lang="Kazakh";
		}
		
		if(path.equals("logout")){
			req.getSession().invalidate();
		}
		
		if(path.equals("addticket")){
			UserDTO me = bean.getMe();
			TicketDTO newticket = new TicketDTO();
			newticket.desc = req.getParameter("ticket[summary]");
			newticket.comment = req.getParameter("ticket[desc]");
			newticket.ownerId = me.username;
			bean.createTicket(newticket);
			tab="4";
//			resp.sendRedirect("hello.html");
		}
		
//		if(path.equals("")){
			UserDTO me = bean.getMe();
		req.setAttribute("proggers", bean.getProggers());
		req.setAttribute("all_tickets", bean.getAllTickets());
		req.setAttribute("my_tickets",bean.getMyTickets(me));
		req.setAttribute("all_projects",bean.getAllProjects());
		req.setAttribute("lang", lang);
		req.setAttribute("tab",tab);
		req.setAttribute("tb",tb);
		req.getRequestDispatcher("/index/index.jsp").forward(req, resp);
//		}
	}

}
