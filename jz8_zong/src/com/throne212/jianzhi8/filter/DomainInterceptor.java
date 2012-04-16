package com.throne212.jianzhi8.filter;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.throne212.jianzhi8.dao.RegionDAO;

public class DomainInterceptor extends AbstractInterceptor {

	private Logger logger = Logger.getLogger(this.getClass());

	private static final long serialVersionUID = -4291195782860785705L;
	
	@Resource
	private RegionDAO regionDAO;
	
	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		logger.debug("into intercepter...");
		return actionInvocation.invoke();
	}

}