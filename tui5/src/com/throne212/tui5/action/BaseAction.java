package com.throne212.tui5.action;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.Action;

public class BaseAction implements Action {
	
	protected Logger logger = Logger.getLogger(this.getClass());
	protected String msg;

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public String execute() {
		return "success";
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
