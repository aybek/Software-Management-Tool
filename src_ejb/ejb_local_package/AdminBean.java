package ejb_local_package;

import java.util.ArrayList;


import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import dto_package.CommentsDTO;
import dto_package.MessageDTO;
import dto_package.ProjectDTO;
import dto_package.TicketDTO;
import dto_package.UserDTO;
import dto_package.RoleDTO;
import entity_package.MessageEntity;
import entity_package.TicketEntity;
import entity_package.UserEntity;
import entity_package.ProjectEntity;
import entity_package.CommentEntity;
import entity_package.RoleEntity;
import interface_local_package.IAdminLocal;

@Stateless
public class AdminBean implements IAdminLocal {
	
	@PersistenceContext(unitName = "persister")
	EntityManager eman;

	@Override
	public List<UserDTO> getAllUsers() {
		List<UserDTO> users = new ArrayList<UserDTO>();
		List<UserEntity> user_entity = eman.createQuery("select e from UserEntity e").getResultList();
		for (UserEntity u: user_entity){
			UserDTO d = new UserDTO();
			d.usersId = u.getUserId();
			d.username = u.getUsername();
			d.email=u.getEmail();
			users.add(d);
		}
		
		return users;
	}
	
	@Override
	public List<MessageDTO> getAllMessages() {
		List<MessageDTO> messages = new ArrayList<MessageDTO>();
		List<MessageEntity> message_entity = eman.createQuery("select e from MessageEntity e").getResultList();
		for (MessageEntity u: message_entity){
			MessageDTO d = new MessageDTO();
			d.messageId = u.getMessageId();
			d.username = u.getUsername();
			d.title=u.getTitle();
			d.message=u.getMessage();
			d.date=u.getDate();
			messages.add(d);
		}
		
		return messages;
	}


	@Override
	public List<TicketDTO> getAllTickets(ProjectDTO pr) {
		List<TicketDTO> tickets = new ArrayList<TicketDTO>();
		List<TicketEntity> ticket_entity = eman.createQuery("select e from TicketEntity e where e.projectId=?1").setParameter(1,pr).getResultList();
		for (TicketEntity u: ticket_entity){
			TicketDTO d = new TicketDTO();
				d.ticketId = u.getTicketId();
				d.desc = u.getDesc();
				d.status = u.getStatus();
				d.comment = u.getComment();
				d.point = u.getPoint();
				try{
					d.workerId = u.getWorker().getUsername();
					}catch (Exception e) {
						d.workerId = "None";
					}
//			for (TicketEntity t: u.getOwnedTickets()){
//				TicketDTO tic = new TicketDTO();
//				tic.ticketId = t.getTicketId();
//				tic.desc = t.getDesc();
//				tic.status = t.getStatus();
//				tickets.add(tic);
//			}
			
			tickets.add(d);
		}
		
		return tickets;
	}
	
	@Override
	public List<RoleDTO> getAllRoles() {
		List<RoleDTO> roles = new ArrayList<RoleDTO>();
		List<RoleEntity> role_entity = eman.createQuery("select e from RoleEntity e").getResultList();
		for (RoleEntity u: role_entity){
			RoleDTO d = new RoleDTO();
				d.role = u.getRole();
			
				roles.add(d);
		}
		
		return roles;
	}

	@Override
	public void createUser(UserDTO newuser) {
		UserEntity user = new UserEntity();
		user.setUsername(newuser.username);
		user.setPassword(newuser.password);
		user.setEmail(newuser.email);
		
		try{
			eman.persist(user);
		}catch(Exception e){
			
		}
	}
	
	@Override
	public void createMessage(MessageDTO newuser) {
		MessageEntity user = new MessageEntity();
		user.setUsername(newuser.username);
		user.setMessage(newuser.message);
		user.setTitle(newuser.title);
		user.setDate(newuser.date);
		try{
			eman.persist(user);
		}catch(Exception e){
			
		}
	}
	
	public List<ProjectDTO> getAllProjects(){
		List<ProjectDTO> projects = new ArrayList<ProjectDTO>();
		List<ProjectEntity> project_entity = eman.createQuery("select e from ProjectEntity e").getResultList();
		for (ProjectEntity u: project_entity){
			ProjectDTO d = new ProjectDTO();
				d.projectId = u.getProjectId();
				d.projectname = u.getProjectname();
//				d.proTickets = u.getProjectTickets();
				projects.add(d);
		}
		return projects;
	}



	@Override
	public List<TicketDTO> getAllTickets() {
		List<TicketDTO> tickets = new ArrayList<TicketDTO>();
		List<TicketEntity> ticket_entity = eman.createQuery("select e from TicketEntity e ").getResultList();
		for (TicketEntity u: ticket_entity){
			TicketDTO d = new TicketDTO();
			
				d.ticketId = u.getTicketId();
				d.desc = u.getDesc();
				d.status = u.getStatus();
				d.comment = u.getComment();
				d.point = u.getPoint();
				
				try{
					d.ownerId=u.getOwner().getUsername();
					d.workerId = u.getWorker().getUsername();
					}catch (Exception e) {
						d.workerId = "None";
					}
				
				List<CommentsDTO> com = new ArrayList<CommentsDTO>();
				for (CommentEntity cl: u.getTicketComments()){
					CommentsDTO dt = new CommentsDTO();
					dt.body=cl.getCommentbody();
					com.add(dt);
				}
				d.ticketcomments=com;

			
			tickets.add(d);
		}
		
		return tickets;
	}

	@Override
	public List<TicketDTO> getAllTickets(Long pr) {
		// TODO Auto-generated method stub
		return null;
	}



}
