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

import dto_package.UserDTO;

public class AdminServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	
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
		
		IUserServicesRemote bean = null;
		InitialContext initContext = new InitialContext();
		
		String path = req.getRequestURI().substring(req.getRequestURI().lastIndexOf("/")+1);
		
		try{
			bean = (IUserServicesRemote)initContext.lookup("helpdesk/UserServicesBean/remote");
		}
		catch(Exception e){
			
		}
		
		if(path.equals("newuser")){
			UserDTO newuser = new UserDTO();
			newuser.username = req.getParameter("username");
			newuser.password = req.getParameter("password");
			newuser.email = req.getParameter("email");
			bean.createUser(newuser);
//			resp.sendRedirect("hello.html");
		}
		
//		if(path.equals("")){
		req.setAttribute("users", bean.getAllUsers());
		req.setAttribute("tickets", bean.getAllTickets());
		req.setAttribute("roles", bean.getAllRoles());
		req.setAttribute("projects",bean.getAllProjects());
		req.getRequestDispatcher("/admin/index.jsp").forward(req, resp);
//		}
	}

}
