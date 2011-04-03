package com.throne212.fupin.domain;

import java.util.Date;

public class Discuss extends MyEntity {
	private Long pid;//父节点id 为0则为主题帖
	private Long rootId;//根节点id
	private User publisher; 
	private String title;
	private String content;
	private int isLeaf;//是否为叶子节点  1为有叶子节点  0为无叶子节点
	private Date lastReplyDate;
	
	public String getShortContent(){
		String shortContent;
		if (this.getContent().length()>16) {
			shortContent=this.getContent().substring(0, 16);
		}else {
			shortContent=this.getContent();
		}
		return shortContent;
	}
	
	public Long getPid() {
		return pid;
	}
	public void setPid(Long pid) {
		this.pid = pid;
	}
	public Long getRootId() {
		return rootId;
	}
	public void setRootId(Long rootId) {
		this.rootId = rootId;
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
	public int getIsLeaf() {
		return isLeaf;
	}
	public void setIsLeaf(int isLeaf) {
		this.isLeaf = isLeaf;
	}
	public User getPublisher() {
		return publisher;
	}
	public void setPublisher(User publisher) {
		this.publisher = publisher;
	}

	public Date getLastReplyDate() {
		return lastReplyDate;
	}

	public void setLastReplyDate(Date lastReplyDate) {
		this.lastReplyDate = lastReplyDate;
	}
	
	
	

}
