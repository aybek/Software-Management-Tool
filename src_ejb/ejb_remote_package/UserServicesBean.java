package ejb_remote_package;


import interface_package.IUserServicesRemote;


import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.ejb.EJB;
import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.jws.WebMethod;
import javax.jws.WebService;


import org.apache.log4j.Logger;
import org.jboss.ejb3.annotation.SecurityDomain;
import org.jboss.wsf.spi.annotation.WebContext;


import dto_package.ProjectDTO;
import dto_package.TicketDTO;
import dto_package.UserDTO;
import dto_package.RoleDTO;
import interface_local_package.IAdminLocal;
import interface_local_package.IClientLocal;
import interface_local_package.IProggerLocal;

import ejb_local_package.IUserServicesLocal;

@Stateless
@Remote(IUserServicesRemote.class)
@SecurityDomain("FSLM")
@WebService(name = "UserServicesWS", targetNamespace = "http://kz.sdu.edu.j2ee.app.project.ws", serviceName = "userServices")
@WebContext(contextRoot = "/project_ws", urlPattern = "/user", authMethod = "BASIC", transportGuarantee = "NONE", secureWSDLAccess = false)
public class UserServicesBean implements IUserServicesLocal {
	
	Logger log = Logger.getLogger(this.getClass().getName());
	
//	@EJB
//	IUserUtilsLocal userUtils; 
//	
//	@EJB
//	IUserDtoUtilsLocal userDtoUtils;
	@EJB
	IAdminLocal adminBean;
	@EJB
	IClientLocal clientBean;
	@EJB
	IProggerLocal proggerBean;
	
	@PostConstruct
	public void init() {
		log.info("stateless constructed");
	}
	
	@PreDestroy
	public void remove() {
		log.info("stateless removed");
	}
	
	@WebMethod
	@Override
	public List<UserDTO> getAllUsers(){
		return adminBean.getAllUsers();
	}
	
	@Override
	public List<TicketDTO> getAllTickets(){
		return adminBean.getAllTickets();
	}
	
	@Override
	public List<RoleDTO> getAllRoles(){
		return adminBean.getAllRoles();
	}
	
	@Override
	public List<ProjectDTO> getAllProjects(){
		return adminBean.getAllProjects();
	}
	
	@Override
	public void createUser(UserDTO newuser){
		adminBean.createUser(newuser);
	}
	
	@Override
	public List<UserDTO> getProggers(){
		return clientBean.getProggers();
	}
	
	@Override
	public UserDTO getMe(){
		return clientBean.getMe();
	}
	
	@Override
	public List<TicketDTO> getMyTickets(UserDTO me) {
		return clientBean.getMyTickets(me);
	}
	
	@Override
	public void createTicket(TicketDTO newticket){
		clientBean.createTicket(newticket);
	}
	
	@Override
	public void closeTicket(Long ticket_id){
		clientBean.closeTicket(ticket_id);
	}
	
	@Override
	public void reopenTicket(Long ticket_id){
		clientBean.reopenTicket(ticket_id);
	}
	
	@Override
	public List<TicketDTO> getProggerTickets(UserDTO me) {
		return proggerBean.getProggerTickets(me);
	}
	
	@Override
	public void acceptTicket(UserDTO user,Long ticket_id){
		proggerBean.acceptTicket( user,ticket_id);
	}
	
	@Override
	public void unacceptTicket(UserDTO user,Long ticket_id){
		proggerBean.unacceptTicket( user,ticket_id);
	}
	
	@Override
	public void resolveTicket(UserDTO user,Long ticket_id){
		proggerBean.resolveTicket(user,ticket_id);
	}
	
	@Override
	public TicketDTO getTicket(Long ticket_id){
		return clientBean.getTicket(ticket_id);
	}
	
//	@RolesAllowed("administrator")
//	@DenyAll
//	@Override
//	public UserDTO getUser(Long index) throws ProjectCommonException {
//		UserDTO res = null;
//		try {
//			UserEntity user = userUtils.getUser(index);
//			log.info(user.getUsername());
//			res = userDtoUtils.covert(user);
////			res = userDtoUtils.covert(userUtils.getUser(index));
//		}catch(Exception e){
//			log.info("Error in UserService");
//			log.error(e);
//			throw new ProjectCommonException(e);			
//		}
//		return res;
//	}

	
}
