package com.throne212.auto.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "auto_user")
public abstract class User extends MyEntity {

	@Column(nullable = false, length = 20, unique = true)
	protected String loginName;

	@Column(nullable = false, length = 16)
	protected String password;

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

}
