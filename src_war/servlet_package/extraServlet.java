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

public class extraServlet extends HttpServlet {
	
/**
	 * 
	 */
	private static final long serialVersionUID = -2592485106207037878L;
/**
	 * 
	 */

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
		
		try{
			bean = (IUserServicesRemote)initContext.lookup("helpdesk/UserServicesBean/remote");
		}
		catch(Exception e){
			
		}
		
			Long ticket_id = Long.parseLong(req.getParameter("ticket_id"));
			req.setAttribute("ticket", bean.getTicket(ticket_id));
			req.getRequestDispatcher("ticket.jsp").forward(req,resp);
		
//		}
	}

}
