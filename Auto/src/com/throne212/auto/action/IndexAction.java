package com.throne212.auto.action;

import com.throne212.auto.biz.UserBiz;

public class IndexAction extends BaseAction {
	
	private UserBiz userBiz;

	public String execute() throws Exception {
		return "index";
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

}
