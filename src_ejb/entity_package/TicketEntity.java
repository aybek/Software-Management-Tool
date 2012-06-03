package entity_package;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="tickets")
public class TicketEntity implements Serializable  {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3338738626951522014L;
	/**
	 * 
	 */
	private Long ticketId;
	private String desc;
	private String status;
	private String comment;
	private Long point;
	private UserEntity ownerId;
	private UserEntity workerId;
	private ProjectEntity projectId;
	
	@Id
	@Column(name = "ticket_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long getTicketId() {
		return ticketId;
	}
	public void setTicketId(Long ticketId) {
		this.ticketId = ticketId;
	}
	@Column(name = "ticketname")
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	@Column(name = "comment")
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	@Column(name = "point")
	public Long getPoint() {
		return point;
	}
	public void setPoint(Long point) {
		this.point = point;
	}
	@Column(name = "status")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@ManyToOne
	@JoinColumn(name="projectid")
	public ProjectEntity getProject(){
		return projectId;
	}
	public void setProject(ProjectEntity projectId){
		this.projectId = projectId;
	}
	
	@ManyToOne
	@JoinColumn(name="owner_id")
	public UserEntity getOwner() {
		return ownerId;
	}
	public void setOwner(UserEntity ownerId) {
		this.ownerId = ownerId;
	}
	
	@ManyToOne
	@JoinColumn(name="worker_id")
	public UserEntity getWorker() {
		return workerId;
	}
	public void setWorker(UserEntity workerId) {
		this.workerId = workerId;
	}
}
