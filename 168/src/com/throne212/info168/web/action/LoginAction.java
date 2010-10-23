package com.throne212.info168.web.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.info168.web.biz.UserBiz;
import com.throne212.info168.web.common.Util;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.domain.Admin;
import com.throne212.info168.web.domain.User;

public class LoginAction extends BaseAction {

	private String username;// 用户名
	private String password;// 密码

	private UserBiz userBiz;// 业务层的用户bean

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public String execute() {
		if (Util.isEmpty(username) || Util.isEmpty(password)) {
			return "fail";
		}
		User user = userBiz.login(username, password);
		if (user == null) {
			msg = "登录失败，请检查用户名和密码";
			return "fail";
		}
		ActionContext.getContext().getSession().put(WebConstants.SESS_USER_OBJ, user);
		if (user instanceof Admin) {
			logger.info("超级管理员登录成功：" + user.getLoginName());
			return "admin";
		}
		return "success";
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
