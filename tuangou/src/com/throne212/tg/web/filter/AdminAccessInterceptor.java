package com.throne212.tg.web.filter;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.logicalcobwebs.proxool.admin.Admin;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.throne212.tg.web.common.WebConstants;
import com.throne212.tg.web.domain.User;

public class AdminAccessInterceptor extends AbstractInterceptor {

	private Logger logger = Logger.getLogger(this.getClass());

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		logger.debug("into admin intercepter ...");
		User sessUser = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(sessUser == null || !(sessUser.getLoginName().equals("admin"))){
			return "login";
		}
		ServletActionContext.getRequest().setCharacterEncoding("UTF-8");
		logger.debug("end admin intercepter ...");
		return actionInvocation.invoke();
	}

}