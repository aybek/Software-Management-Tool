package interface_local_package;

import java.util.List;



import javax.ejb.Local;

import dto_package.ProjectDTO;
import dto_package.RoleDTO;
import dto_package.TicketDTO;
import dto_package.UserDTO;

@Local
public interface IClientLocal {
	List<UserDTO> getProggers();
	void createTicket(TicketDTO newticket);
	UserDTO getMe();
	List<TicketDTO> getMyTickets(UserDTO me);
	void closeTicket(Long ticket_id);
	void reopenTicket(Long ticket_id);
	TicketDTO getTicket(Long ticket_id);
	UserDTO getProject();
	ProjectDTO getProject(Long projectId);
	void addComment(String st, Long ticket_id);
}
