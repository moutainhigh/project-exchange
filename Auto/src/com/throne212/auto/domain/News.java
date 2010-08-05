package com.throne212.auto.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.throne212.auto.common.WebConstants;

@Entity
@Table(name = "auto_news")
public class News extends MyEntity{//消息
	
	@ManyToOne(cascade=CascadeType.PERSIST,fetch=FetchType.EAGER)
	private Category category;

	@Column
	private String title;
	@Column
	private String content;
	@Column(name="fromWhere")
	private String from;
	@Column
	private String author;
	@Column
	private Date publishDate;
	@Column
	private int type;
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
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
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getTypeText() {
		switch (type) {
		case WebConstants.NEWS_NEWS:
			return "新闻";
		case WebConstants.NEWS_ACTIVE:
			return "动态";
		default:
			break;
		}
		return "";
	}
	
	
}
