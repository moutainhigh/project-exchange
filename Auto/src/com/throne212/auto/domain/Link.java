package com.throne212.auto.domain;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "auto_link")
public class Link extends MyEntity{

	private String url;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
	
}
