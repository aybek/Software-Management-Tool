package interface_local_package;

import java.util.List;



import javax.ejb.Local;

import dto_package.MessageDTO;
import dto_package.RoleDTO;
import dto_package.TicketDTO;
import dto_package.UserDTO;
import dto_package.ProjectDTO;

@Local
public interface IAdminLocal {
	List<UserDTO> getAllUsers();
	List<TicketDTO> getAllTickets();
	List<RoleDTO> getAllRoles();
	void createUser(UserDTO newuser);
	List<ProjectDTO> getAllProjects();

	List<MessageDTO> getAllMessages();
	void createMessage(MessageDTO newuser);
	List<TicketDTO> getAllTickets(Long pr);
	List<TicketDTO> getAllTickets(ProjectDTO pr);
}
