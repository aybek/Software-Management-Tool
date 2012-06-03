package entity_package;

import java.io.Serializable;

import java.lang.String;
import java.util.List;

import javax.persistence.*;



@Entity
@Table(name="roles")
public class RoleEntity implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2503275379864277888L;
	private String role;
	private List<UserEntity> users;

	public RoleEntity() { 
		super();
	}   
	@Id
	@Column(name="role")
	@GeneratedValue(strategy=GenerationType.AUTO)
	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	@ManyToMany
	@JoinTable(name="user_roles",
			joinColumns=@JoinColumn(name="role",referencedColumnName="role"),
			inverseJoinColumns= @JoinColumn(name="user_id", referencedColumnName="user_id")	)
	public List<UserEntity> getUsers(){
		return this.users;
	}
	public void setUsers(List<UserEntity> users){
		this.users = users;
	}
}