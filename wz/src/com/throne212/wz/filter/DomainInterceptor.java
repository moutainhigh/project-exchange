package com.throne212.wz.filter;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.throne212.wz.common.Consts;
import com.throne212.wz.domain.User;

public class DomainInterceptor extends AbstractInterceptor {

	private Logger logger = Logger.getLogger(this.getClass());

	private static final long serialVersionUID = -4291195782860785705L;
	
	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		logger.debug("into user info intercepter...");
		User user = (User) ActionContext.getContext().getSession().get(Consts.SESS_USER_OBJ);
		if(user == null){
			return "login";
		}
		return actionInvocation.invoke();
	}

}