package com.throne212.fupin.domain;

import java.io.Serializable;

//用户的抽象类
public class User extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	private String loginName;// 登录名
	private String password;// 密码

	// 帮扶责任人信息
	private String name;// 名称
	private String tel;// 电话
	private String email;// 邮箱

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
