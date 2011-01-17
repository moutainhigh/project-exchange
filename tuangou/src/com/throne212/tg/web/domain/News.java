package com.throne212.tg.web.domain;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;


@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(discriminatorType = DiscriminatorType.STRING)
@DiscriminatorValue("news")
public class News extends Component {
	
	public static String componentName = "网站新闻信息";
	@Column(name = "url")
	private String url;
	@Column(name = "title")
	private String title;
	@Column(name = "content")
	private String content;
	@Column(name = "author")
	private String author;
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
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
