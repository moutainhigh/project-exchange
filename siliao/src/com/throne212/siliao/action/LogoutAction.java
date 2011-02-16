package com.throne212.siliao.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.siliao.common.WebConstants;

public class LogoutAction extends BaseAction {

	public String execute() {
		ActionContext.getContext().getSession().remove(WebConstants.SESS_USER_OBJ);
		return "success";
	}

}
