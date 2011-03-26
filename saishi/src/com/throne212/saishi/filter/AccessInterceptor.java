package com.throne212.saishi.filter;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.throne212.saishi.action.LoginAction;
import com.throne212.saishi.common.WebConstants;
import com.throne212.saishi.domain.User;


public class AccessInterceptor extends AbstractInterceptor {

	private Logger logger = Logger.getLogger(this.getClass());

	private static final long serialVersionUID = -4291195782860785705L;
	

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		//登录不进行拦截
		if(actionInvocation.getAction() instanceof LoginAction){
			return actionInvocation.invoke();
		}
		logger.debug("into intercepter ...");
		User sessUser = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(sessUser == null){
			ActionContext.getContext().put("msg", "您还未登录或登录超时");
			return "login";
		}
		ServletActionContext.getRequest().setCharacterEncoding("UTF-8");
		logger.debug("end intercepter ...");
		return actionInvocation.invoke();
	}

}
