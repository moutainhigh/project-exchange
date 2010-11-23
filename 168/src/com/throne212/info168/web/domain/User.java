package com.throne212.info168.web.domain;

import java.util.Date;

public class User {

	private Long id;//主键
	private String loginName;//登录名
	private String password;//密码
	private String email;//邮件地址
	private Area area;//所属地区
	private Date regDate;//注册时间
	private Contact contact; 

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String loginName, String password) {
		super();
		this.loginName = loginName;
		this.password = password;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

}
