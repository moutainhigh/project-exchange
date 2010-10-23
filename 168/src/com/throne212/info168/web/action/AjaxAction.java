package com.throne212.info168.web.action;

import java.util.List;

import com.throne212.info168.web.biz.UserBiz;
import com.throne212.info168.web.domain.User;

public class AjaxAction extends BaseAction {

	/* 通用的变量 */
	private List list;

	private UserBiz userBiz;

	// ajax检查登录名是否重复
	private String loginName;
	public String checkLoginName() {
		boolean rst = userBiz.checkUnique(User.class, "loginName", loginName);
		if(rst == true)
			this.setMsg("succ");
		else
			this.setMsg("fail");
		return "check_login_name";
	}

	/* setters and getters */

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

}
