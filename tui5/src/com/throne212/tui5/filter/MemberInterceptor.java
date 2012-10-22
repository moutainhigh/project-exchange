package com.throne212.tui5.filter;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.throne212.tui5.common.Const;
import com.throne212.tui5.domain.User;

public class MemberInterceptor extends AbstractInterceptor {

	private Logger logger = Logger.getLogger(this.getClass());

	private static final long serialVersionUID = -4291195782860785705L;
	
	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		//logger.debug("into intercepter...");
		Object userObj = ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		if(userObj == null || !(userObj instanceof User)){
			HttpServletRequest request = ServletActionContext.getRequest();
			String returnurl = request.getRequestURI() + "?";
			for(Object key : request.getParameterMap().keySet()){
				Object val = request.getParameterMap().get(key);
				if(val instanceof String[]){
					String[] arr = (String[]) val;
					returnurl += key + "=" + arr[0];
				}
			}
			request.setAttribute(Const.REQ_RETURN_URL, returnurl);
			return "login";
		}
		return actionInvocation.invoke();
	}

}