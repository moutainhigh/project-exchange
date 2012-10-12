package com.throne212.tui5.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tui5.common.Const;

public class LoginAction extends BaseAction {

	public String login() {
		return "login";
	}

	public String logout() {
		ActionContext.getContext().getSession().put(Const.SESS_USER_OBJ, null);
		return "login";
	}
	
}
