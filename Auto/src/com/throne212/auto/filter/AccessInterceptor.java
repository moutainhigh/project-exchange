package com.throne212.auto.filter;

import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.throne212.auto.biz.UserBiz;
import com.throne212.auto.common.WebConstants;

public class AccessInterceptor extends AbstractInterceptor {

	private Logger logger = Logger.getLogger(this.getClass());

	private static final long serialVersionUID = -4291195782860785705L;
	
	private UserBiz userBiz;

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		logger.debug("into manage intercepter ...");
		Map session = actionInvocation.getInvocationContext().getSession();
		if(session.get(WebConstants.SESS_USER_OBJ) == null){
			return "index";
		}
		logger.debug("end manage intercepter ...");
		return actionInvocation.invoke();
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

}