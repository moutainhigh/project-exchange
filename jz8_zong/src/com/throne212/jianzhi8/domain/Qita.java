package com.throne212.jianzhi8.domain;
// default package

import java.sql.Timestamp;

/**
 * Qita entity. @author MyEclipse Persistence Tools
 */

public class Qita implements java.io.Serializable {

	// Fields

	private Integer qitaNo;
	private String qitaType;
	private String qitaTitle;
	private String qitaContent;
	private Timestamp qitaUpdate;
	private Integer qitaClick;
	private String qitaAuthor;
	private String qitaIscheck;

	public String getKey(){
		if(qitaType == null)
			return null;
		if(qitaType.startsWith("A")){
			return "jianli";
		}else if(qitaType.startsWith("B")){
			return "zhidao";
		}else if(qitaType.startsWith("C")){
			return "lunwen";
		}else if(qitaType.startsWith("D")){
			return "jiqiao";
		}else if(qitaType.startsWith("E")){
			return "baogao";
		}else if(qitaType.startsWith("F")){
			return "edu";
		}
		return null;
	}
	
	// Constructors

	/** default constructor */
	public Qita() {
	}

	/** minimal constructor */
	public Qita(String qitaType, String qitaTitle, String qitaContent, Timestamp qitaUpdate, Integer qitaClick) {
		this.qitaType = qitaType;
		this.qitaTitle = qitaTitle;
		this.qitaContent = qitaContent;
		this.qitaUpdate = qitaUpdate;
		this.qitaClick = qitaClick;
	}

	/** full constructor */
	public Qita(String qitaType, String qitaTitle, String qitaContent, Timestamp qitaUpdate, Integer qitaClick, String qitaAuthor, String qitaIscheck) {
		this.qitaType = qitaType;
		this.qitaTitle = qitaTitle;
		this.qitaContent = qitaContent;
		this.qitaUpdate = qitaUpdate;
		this.qitaClick = qitaClick;
		this.qitaAuthor = qitaAuthor;
		this.qitaIscheck = qitaIscheck;
	}

	// Property accessors

	public Integer getQitaNo() {
		return this.qitaNo;
	}

	public void setQitaNo(Integer qitaNo) {
		this.qitaNo = qitaNo;
	}

	public String getQitaType() {
		return this.qitaType;
	}

	public void setQitaType(String qitaType) {
		this.qitaType = qitaType;
	}

	public String getQitaTitle() {
		return this.qitaTitle;
	}

	public void setQitaTitle(String qitaTitle) {
		this.qitaTitle = qitaTitle;
	}

	public String getQitaContent() {
		return this.qitaContent;
	}

	public void setQitaContent(String qitaContent) {
		this.qitaContent = qitaContent;
	}

	public Timestamp getQitaUpdate() {
		return this.qitaUpdate;
	}

	public void setQitaUpdate(Timestamp qitaUpdate) {
		this.qitaUpdate = qitaUpdate;
	}

	public Integer getQitaClick() {
		return this.qitaClick;
	}

	public void setQitaClick(Integer qitaClick) {
		this.qitaClick = qitaClick;
	}

	public String getQitaAuthor() {
		return this.qitaAuthor;
	}

	public void setQitaAuthor(String qitaAuthor) {
		this.qitaAuthor = qitaAuthor;
	}

	public String getQitaIscheck() {
		return this.qitaIscheck;
	}

	public void setQitaIscheck(String qitaIscheck) {
		this.qitaIscheck = qitaIscheck;
	}

}