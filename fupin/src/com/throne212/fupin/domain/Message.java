package com.throne212.fupin.domain;


public class Message extends MyEntity {
	private String title;
	private String content;
	private String attatch;
	private User sender;
	private String recieverString;
	private User reciever;
	
	
	public String getShortContent(){
		String shortContent;
		if (this.getContent().length()>16) {
			shortContent=this.getContent().substring(0, 16);
		}else {
			shortContent=this.getContent();
		}
		return shortContent;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAttatch() {
		return attatch;
	}
	public void setAttatch(String attatch) {
		this.attatch = attatch;
	}
	public User getSender() {
		return sender;
	}
	public void setSender(User sender) {
		this.sender = sender;
	}
	public String getRecieverString() {
		return recieverString;
	}
	public void setRecieverString(String recieverString) {
		this.recieverString = recieverString;
	}
	public User getReciever() {
		return reciever;
	}
	public void setReciever(User reciever) {
		this.reciever = reciever;
	}
	
	

	
	

}
