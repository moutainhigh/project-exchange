package com.throne212.siliao.domain;

import java.io.Serializable;

//用户的操作日志
public class UserLog extends Log implements Serializable {

	private static final long serialVersionUID = 1L;
	private User user;// 操作的利率
	private String remark;
	private String email;
	private String tel;
	private String name;
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
