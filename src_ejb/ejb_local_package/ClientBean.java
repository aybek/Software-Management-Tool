package ejb_local_package;
import java.util.ArrayList;

import java.util.List;

import javax.annotation.Resource;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import dto_package.CommentsDTO;
import dto_package.ProjectDTO;
import dto_package.TicketDTO;
import dto_package.UserDTO;
import entity_package.CommentEntity;
import entity_package.ProjectEntity;
import entity_package.RoleEntity;
import entity_package.TicketEntity;
import entity_package.UserEntity;
import interface_local_package.IClientLocal;

@Stateless
public class ClientBean implements IClientLocal {
	
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


	@Override
	public void createTicket(TicketDTO newticket) {
		TicketEntity t = new TicketEntity();
		t.setDesc(newticket.desc);
		t.setComment(newticket.comment);
		t.setStatus("New");
		t.setPoint(newticket.point);
		UserEntity user_entity = (UserEntity) eman.createQuery("select e from UserEntity e where e.username=?1").setParameter(1,newticket.ownerId).getSingleResult();
		t.setOwner(user_entity);
		try{
			eman.persist(t);
		}catch(Exception e){
			
		}
	}
	
	@Override
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
	public ProjectDTO getProject(Long projectId){
		
		ProjectEntity project_entity = (ProjectEntity) eman.createQuery("select e from ProjectEntity e where e.projectId=?1").setParameter(1,projectId).getSingleResult();
		ProjectDTO project = new ProjectDTO();
		project.projectId = project_entity.getProjectId();
		return project;
	}





	@Override
	public List<TicketDTO> getMyTickets(UserDTO me) {
		UserEntity p = eman.find(UserEntity.class, me.usersId);
		List<TicketDTO> tickets = new ArrayList<TicketDTO>();
		
		for (TicketEntity u: p.getWorkingTickets()){
			TicketDTO d = new TicketDTO();
				d.ticketId = u.getTicketId();
				d.desc = u.getDesc();
				d.status = u.getStatus();
				d.comment = u.getComment();
				
				
				try{
					d.ownerId = u.getOwner().getUsername();
				d.workerId = u.getWorker().getUsername();
				}catch (Exception e) {
					d.workerId = "None";
				}
				d.point = u.getPoint();
			tickets.add(d);
		}
		
		return tickets;
	}
	
	@Override
	public void closeTicket(Long ticket_id){
		TicketEntity r = eman.find(TicketEntity.class, ticket_id);
		r.setStatus("Closed");
		try{
			eman.persist(r);
		}catch(Exception e){
			
		}
	}
	
	@Override
	public void addComment(String st,Long ticket_id){
		
		TicketEntity ticket_entity = (TicketEntity) eman.createQuery("select e from TicketEntity e where e.ticketId=?1").setParameter(1,ticket_id).getSingleResult();
		CommentEntity t = new CommentEntity();
		t.setCommentbody(st);
		t.setTicket(ticket_entity);
		
		try{
			eman.persist(t);
		}catch(Exception e){
			
		}
	}
	
	@Override
	public void reopenTicket(Long ticket_id){
		TicketEntity r = eman.find(TicketEntity.class, ticket_id);
		r.setStatus("Reopened");
		try{
			eman.persist(r);
		}catch(Exception e){
			
		}
	}
	
	@Override
	public TicketDTO getTicket(Long ticket_id){
		TicketEntity r = eman.find(TicketEntity.class, ticket_id);
		TicketDTO t = new TicketDTO();
		t.comment = r.getComment();
		t.desc = r.getDesc();
		t.ownerId = r.getOwner().getUsername();
		t.status = r.getStatus();
		t.point = r.getPoint();
		t.ticketId = r.getTicketId();
		try{
			t.ownerId=r.getOwner().getUsername();
			t.workerId = r.getWorker().getUsername();
			}catch (Exception e) {
				t.workerId = "None";
			}
		
		List<CommentsDTO> com = new ArrayList<CommentsDTO>();
		for (CommentEntity cl: r.getTicketComments()){
			CommentsDTO dt = new CommentsDTO();
			dt.body=cl.getCommentbody();
			com.add(dt);
		}
		t.ticketcomments=com;
		return t;
	}


	@Override
	public UserDTO getProject() {
		// TODO Auto-generated method stub
		return null;
	}


}
