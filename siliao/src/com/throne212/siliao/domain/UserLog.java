package com.throne212.siliao.domain;

import java.io.Serializable;

//用户的操作日志
public class UserLog extends Log implements Serializable {

	private static final long serialVersionUID = 1L;
	private User user;// 操作的利率

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
