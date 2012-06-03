package interface_local_package;

import java.util.List;



import javax.ejb.Local;

import dto_package.RoleDTO;
import dto_package.TicketDTO;
import dto_package.UserDTO;

@Local
public interface IProggerLocal {

	List<UserDTO> getProggers();

	UserDTO getMe();


	void acceptTicket(UserDTO user,Long ticket_id);

	void resolveTicket(UserDTO user,Long ticket_id);

	List<TicketDTO> getProggerTickets(UserDTO me);

	void unacceptTicket(UserDTO user, Long ticket_id);
	
}
