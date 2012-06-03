package ejb_local_package;

import java.util.ArrayList;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import dto_package.ProjectDTO;
import dto_package.TicketDTO;
import dto_package.UserDTO;
import dto_package.RoleDTO;
import entity_package.TicketEntity;
import entity_package.UserEntity;
import entity_package.ProjectEntity;
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
			
//			List<TicketDTO> ownedTickets = new ArrayList<TicketDTO>();
//			
//			for (TicketEntity t: u.getOwnedTickets()){
//				TicketDTO tic = new TicketDTO();
//				tic.ticketId = t.getTicketId();
//				tic.desc = t.getDesc();
//				tic.status = t.getStatus();
//				ownedTickets.add(tic);
//			}
//			d.ownedTickets = ownedTickets;
//			
//			List<TicketDTO> workingTickets = new ArrayList<TicketDTO>();
//			for (TicketEntity t: u.getOwnedTickets()){
//				TicketDTO tic = new TicketDTO();
//				tic.ticketId = t.getTicketId();
//				tic.desc = t.getDesc();
//				tic.status = t.getStatus();
//				workingTickets .add(tic);
//			}
//			d.workingTickets  = workingTickets ;
//			
			users.add(d);
		}
		
		return users;
	}

	@Override
	public List<TicketDTO> getAllTickets() {
		List<TicketDTO> tickets = new ArrayList<TicketDTO>();
		List<TicketEntity> ticket_entity = eman.createQuery("select e from TicketEntity e").getResultList();
		for (TicketEntity u: ticket_entity){
			TicketDTO d = new TicketDTO();
				d.ticketId = u.getTicketId();
				d.desc = u.getDesc();
				d.status = u.getStatus();
				d.comment = u.getComment();
				d.point = u.getPoint();
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

}
