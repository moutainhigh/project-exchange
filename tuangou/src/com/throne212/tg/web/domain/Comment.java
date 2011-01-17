package com.throne212.tg.web.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;

import com.throne212.tg.web.common.Util;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(discriminatorType = DiscriminatorType.STRING)
@DiscriminatorValue("comment")
public class Comment extends Component {
	public static String componentName = "团购信息评论";
	@Column(name = "user_name")
	private String userName;
	@Column(name = "content")
	private String content;
	@Column(name = "reply_name")
	private String replyName;
	@Column(name = "reply_content")
	private String replyContent;
	@ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER, targetEntity = Teams.class)
	private Teams team;
	
	public Teams getTeam() {
		return team;
	}
	public void setTeam(Teams team) {
		this.team = team;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReplyName() {
		return replyName;
	}
	public void setReplyName(String replyName) {
		this.replyName = replyName;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getShortContent() {
		String shortContent=this.content;
		if (this.content.length()>12) {
		shortContent=this.content.substring(0, 12)+"...";
		return shortContent;
		}
		
		return shortContent;
		
		
	}
}
