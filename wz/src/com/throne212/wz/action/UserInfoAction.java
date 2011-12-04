package com.throne212.wz.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.throne212.wz.biz.UserBiz;
import com.throne212.wz.domain.User;

public class UserInfoAction extends BaseAcion {

	private UserBiz userBiz;
	
	private User user;

	@Autowired
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	} 

	public String index(){
		return "index";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}
	
}
