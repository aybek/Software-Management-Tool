package ejb_local_package;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import dto_package.TicketDTO;
import dto_package.UserDTO;
import entity_package.RoleEntity;
import entity_package.TicketEntity;
import entity_package.UserEntity;
import interface_local_package.IClientLocal;
import interface_local_package.IProggerLocal;

@Stateless
public class ProggerBean implements IProggerLocal {
	
	@PersistenceContext(unitName = "persister")
	EntityManager eman;
	
	@Resource
	SessionContext session;

	@Override
	public List<UserDTO> getProggers() {
		List<UserDTO> users = new ArrayList<UserDTO>();
		RoleEntity r = eman.find(RoleEntity.class, "progger");
		for (UserEntity u: r.getUsers()){
			UserDTO d = new UserDTO();
			d.usersId = u.getUserId();
			d.username = u.getUsername();
			d.email = u.getEmail();
			users.add(d);
		}
		return users;
	}


	public UserDTO getMe(){
		String username = session.getCallerPrincipal().getName();
		UserEntity user_entity = (UserEntity) eman.createQuery("select e from UserEntity e where e.username=?1").setParameter(1,username).getSingleResult();
		UserDTO user = new UserDTO();
		user.usersId = user_entity.getUserId();
		user.username = user_entity.getUsername();
		user.email = user_entity.getEmail();
		return user;
	}



	@Override
	public List<TicketDTO> getProggerTickets(UserDTO me) {
		UserEntity p = eman.find(UserEntity.class, me.usersId);
		List<TicketDTO> tickets = new ArrayList<TicketDTO>();
		
		for (TicketEntity u: p.getWorkingTickets()){
			TicketDTO d = new TicketDTO();
				d.ticketId = u.getTicketId();
				d.desc = u.getDesc();
				d.status = u.getStatus();
				d.comment = u.getComment();
				d.point = u.getPoint();
			tickets.add(d);
		}
		
		return tickets;
	}
	
	@Override
	public void acceptTicket(UserDTO user,Long ticket_id){
		TicketEntity r = eman.find(TicketEntity.class, ticket_id);
		UserEntity u = eman.find(UserEntity.class, user.usersId);
		r.setStatus("Accepted");
		r.setWorker(u);
		try{
			eman.persist(r);
		}catch(Exception e){
			
		}
	}
	
	@Override
	public void unacceptTicket(UserDTO user,Long ticket_id){
		TicketEntity r = eman.find(TicketEntity.class, ticket_id);
		UserEntity u = eman.find(UserEntity.class, user.usersId);
		r.setStatus("New");
		r.setWorker(u);
		try{
			eman.persist(r);
		}catch(Exception e){
			
		}
	}
	
	@Override
	public void resolveTicket(UserDTO user,Long ticket_id){
		TicketEntity r = eman.find(TicketEntity.class, ticket_id);
		r.setStatus("Resolved");
		try{
			eman.persist(r);
		}catch(Exception e){
			
		}
	}


}


