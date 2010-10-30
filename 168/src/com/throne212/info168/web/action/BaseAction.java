package com.throne212.info168.web.action;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.domain.Area;

//所有Action的基础类
public class BaseAction {
	protected Logger logger = Logger.getLogger(this.getClass());
	protected String msg;// 错误提示信息

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	private String pageName;
	private String cityPinyin;
	public String execute() {
		if("index".equals(pageName)){
			Area city = (Area) ActionContext.getContext().getSession().get(WebConstants.SESS_CITY);
			if(city==null)
				cityPinyin = "all";
			else
				cityPinyin = city.getPinyin();
			return "index";
		}
		return "success";
	}

	public String getPageName() {
		return pageName;
	}

	public String getCityPinyin() {
		return cityPinyin;
	}

	public void setCityPinyin(String cityPinyin) {
		this.cityPinyin = cityPinyin;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
	
}
