package com.throne212.auto.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.throne212.auto.common.WebConstants;


public class LogoutAction extends BaseAction {

	public String execute() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		logger.info("logout-----username:[" + session.getAttribute(WebConstants.SESS_USER_NAME) + "]");
		session.setAttribute(WebConstants.SESS_USER_NAME, null);
		session.setAttribute(WebConstants.SESS_USER_OBJ, null);
		session.invalidate();
		return SUCCESS;
	}

}
