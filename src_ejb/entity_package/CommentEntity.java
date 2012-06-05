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
@Table(name="comments")
public class CommentEntity implements Serializable  {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3338738626951522014L;
	/**
	 * 
	 */
	private Long commentId;
	private String commentbody;

	private TicketEntity ticketId;
	
	@Id
	@Column(name = "comment_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long getCommentId() {
		return commentId;
	}
	public void setCommentId(Long commentId) {
		this.commentId = commentId;
	}
	@Column(name = "commentbody")
	public String getCommentbody() {
		return commentbody;
	}
	public void setCommentbody(String commentbody) {
		this.commentbody = commentbody;
	}
	
	
	@ManyToOne
	@JoinColumn(name="ticketid")
	public TicketEntity getTicket(){
		return ticketId;
	}
	public void setTicket(TicketEntity ticketId){
		this.ticketId = ticketId;
	}
	
	
	
	
}
