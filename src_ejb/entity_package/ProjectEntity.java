package entity_package;

import java.io.Serializable;

import java.lang.Long;
import java.lang.String;
import java.util.List;

import javax.persistence.*;

import entity_package.TicketEntity;

@Entity
@Table(name="projects")
public class ProjectEntity implements Serializable {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 3109810269461208655L;
	private Long projectId;
	private String projectname;
	private List<TicketEntity> protickets;

	public ProjectEntity() { 
		super();
	}   
	@Id
	@Column(name="project_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Long getProjectId() {
		return this.projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}   
	@Column(name="projectname")
	public String getProjectname() {
		return this.projectname;
	}

	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	
	@OneToMany(mappedBy="project")
	public List<TicketEntity> getProjectTickets(){
		return protickets;
	}
	
	public void setProjectTickets(List<TicketEntity> tickets) {
		this.protickets = tickets;
	}
	
}