package com.throne212.auto.domain;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "auto_setting")
public class Setting extends MyEntity {// Æû³µÆ·ÅÆ

	private String pageTitle;
	private String pageKeywords;
	private String pageDescription;

	public String getPageTitle() {
		return pageTitle;
	}

	public void setPageTitle(String pageTitle) {
		this.pageTitle = pageTitle;
	}

	public String getPageKeywords() {
		return pageKeywords;
	}

	public void setPageKeywords(String pageKeywords) {
		this.pageKeywords = pageKeywords;
	}

	public String getPageDescription() {
		return pageDescription;
	}

	public void setPageDescription(String pageDescription) {
		this.pageDescription = pageDescription;
	}

}
