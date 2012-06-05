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

public class ProggerServlet extends HttpServlet {
	
	private static final long serialVersionUID = 9038335697563628675L;
	
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
		
		if(path.equals("active")){
			tab="1";
		}
		if(path.equals("closed")){
			tab="4";
		}
		if(path.equals("myactive")){
			tab="2";
		}
		if(path.equals("verify")){
			tab="3";
		}
		
		if(path.equals("accept")){
			UserDTO me = bean.getMe();
			Long ticket_id = Long.parseLong(req.getParameter("ticket_id"));
			bean.acceptTicket(me,ticket_id);
//			resp.sendRedirect("hello.html");
			tab="4";
		}
		
		if(path.equals("unaccept")){
			UserDTO me = bean.getMe();
			Long ticket_id = Long.parseLong(req.getParameter("ticket_id"));
			bean.unacceptTicket(me,ticket_id);
			tab="4";
//			resp.sendRedirect("hello.html");
		}
		
		if(path.equals("resolve")){
			UserDTO me = bean.getMe();
			Long ticket_id = Long.parseLong(req.getParameter("ticket_id"));
			bean.resolveTicket(me,ticket_id);
			tab="";
//			resp.sendRedirect("hello.html");
		}
		
//		if(path.equals("")){
			UserDTO me = bean.getMe();
		req.setAttribute("all_tickets", bean.getAllTickets());
		req.setAttribute("tab", tab);
		req.setAttribute("my_tickets",bean.getProggerTickets(me));
		req.getRequestDispatcher("/progger/index.jsp").forward(req, resp);
//		}
	}

}
