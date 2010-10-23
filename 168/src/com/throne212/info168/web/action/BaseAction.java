package com.throne212.info168.web.action;

import org.apache.log4j.Logger;
//所有Action的基础类
public class BaseAction {
	protected Logger logger = Logger.getLogger(this.getClass());
	protected String msg;//错误提示信息

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
	
}
