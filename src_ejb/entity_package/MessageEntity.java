package entity_package;

import java.io.Serializable;

import java.lang.Long;
import java.lang.String;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

import entity_package.TicketEntity;

@Entity
@Table(name="messages")
public class MessageEntity implements Serializable {
	
	private static final long serialVersionUID = 4267122695937030038L;
	private Long messageId;
	private String username;
	private String message;
	private String title;
	private Date date;
	
	public MessageEntity() { 
		super();
	}   
	@Id
	@Column(name="message_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Long getMessageId() {
		return this.messageId;
	}

	public void setMessageId(Long messageId) {
		this.messageId = messageId;
	}
	
	@Column(name="username")
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	@Column(name="date")
	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	
	@Column(name="title")
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	
	@Column(name="message")
	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}   
	
}