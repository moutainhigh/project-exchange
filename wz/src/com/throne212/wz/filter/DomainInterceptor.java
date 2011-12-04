package com.throne212.wz.filter;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.config.entities.ActionConfig;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.throne212.wz.common.Consts;

public class DomainInterceptor extends AbstractInterceptor {

	private Logger logger = Logger.getLogger(this.getClass());

	private static final long serialVersionUID = -4291195782860785705L;
	
	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		logger.debug("into intercepter...");
		HttpServletRequest request = ServletActionContext.getRequest();
		String host = request.getHeader("Host");
		logger.debug("host: " + host);
		String[] arr = host.split("\\.");
		if(arr != null && arr.length > 0){
			String regId = arr[0];			
			logger.debug("region id: " + regId);
			ActionContext.getContext().getSession().put(Consts.SESS_CITY_ID, regId);
		}
		return actionInvocation.invoke();
	}

}