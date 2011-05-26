package com.throne212.saishi.domain;

public class News extends MyEntity {
	private String title;
	private String content;
	private String author;
	private String url;
	private String type;
	
	public String getShortContent(){
		if(this.getContent()==null)
			return null;
		String shortContent;
		if (this.getContent().length()>16) {
			shortContent=this.getContent().substring(0, 16)+"...";
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
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
