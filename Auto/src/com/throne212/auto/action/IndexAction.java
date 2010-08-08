package com.throne212.auto.action;

import com.throne212.auto.biz.UserBiz;

public class IndexAction extends BaseAction {
	
	private UserBiz userBiz;
	
	private String username;

	public String execute() throws Exception {
		logger.debug("=================username="+username);
		return "index";
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}

}
