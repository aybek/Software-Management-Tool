package interface_local_package;

import java.util.List;

import javax.ejb.Local;
import dto_package.TicketDTO;

@Local
public interface IMessageLocal {
	List<TicketDTO> getAllTickets();
}
