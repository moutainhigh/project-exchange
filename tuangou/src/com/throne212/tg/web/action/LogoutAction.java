package com.throne212.tg.web.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tg.web.common.WebConstants;

public class LogoutAction extends BaseAction {

	public String execute() {
		ActionContext.getContext().getSession().remove(WebConstants.SESS_USER_OBJ);
		return "success";
	}

}
