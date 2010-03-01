package com.throne212.proj.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;

//用户实体
@Entity(name = "User")
//@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
//@DiscriminatorColumn(name = "userType", discriminatorType = DiscriminatorType.STRING)
public class User extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(unique = true, nullable = false, length = 20)
	protected String loginName;

	@Column(nullable = true, length = 20)
	protected String password;

	@Column(nullable = false)
	protected Date createdDate;

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

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

}
