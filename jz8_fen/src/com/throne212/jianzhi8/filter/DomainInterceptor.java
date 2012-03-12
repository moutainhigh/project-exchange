package com.throne212.jianzhi8.filter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.throne212.jianzhi8.common.Consts;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.domain.Region;

public class DomainInterceptor extends AbstractInterceptor {

	private Logger logger = Logger.getLogger(this.getClass());

	private static final long serialVersionUID = -4291195782860785705L;
	
	@Resource
	private RegionDAO regionDAO;
	
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
			if(regId != null && !regId.equals(ActionContext.getContext().getSession().get(Consts.SESS_CITY_ID))){
				ActionContext.getContext().getSession().put(Consts.SESS_CITY_ID, regId);
				Region city = regionDAO.findById(regId);
				ActionContext.getContext().getSession().put(Consts.SESS_CITY, city);
			}
		}
		return actionInvocation.invoke();
	}

}