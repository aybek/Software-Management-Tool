package entity_package;

import java.io.Serializable;
import java.lang.Long;
import java.lang.String;
import java.util.List;

import javax.persistence.*;

import entity_package.TicketEntity;

@Entity
@Table(name="users")
public class UserEntity implements Serializable {
	
	private static final long serialVersionUID = 4267122695937030038L;
	private Long userId;
	private String username;
	private String password;
	private String email;
	private List<TicketEntity> ownedtickets;
	private List<TicketEntity> workingtickets;
	private List<RoleEntity> roles;

	public UserEntity() { 
		super();
	}   
	@Id
	@Column(name="user_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Long getUserId() {
		return this.userId;
	}

	public void setUserId(Long usersId) {
		this.userId = usersId;
	}   
	@Column(name="username")
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	@Column(name="email")
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}   

	@Column(name="password")
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@OneToMany(mappedBy="owner")
	public List<TicketEntity> getOwnedTickets() {
		return ownedtickets;
	}
	public void setOwnedTickets(List<TicketEntity> tickets) {
		this.ownedtickets = tickets;
	}
	
	@OneToMany(mappedBy="worker")
	public List<TicketEntity> getWorkingTickets() {
		return workingtickets;
	}
	public void setWorkingTickets(List<TicketEntity> tickets) {
		this.workingtickets = tickets;
	}
	
	@ManyToMany(mappedBy="users")
	public List<RoleEntity> getRoles() {
		return this.roles;
	}
	public void setRoles(List<RoleEntity> roles) {
		this.roles = roles;
	}
}