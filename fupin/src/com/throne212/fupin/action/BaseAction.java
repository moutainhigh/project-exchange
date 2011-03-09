package com.throne212.fupin.action;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.Action;

//所有Action的基础类
public class BaseAction implements Action{
	protected Logger logger = Logger.getLogger(this.getClass());
	protected String msg;// 错误提示信息
	protected String succ;//成功与否

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

	public String execute() {
		return "success";
	}

	public String getSucc() {
		return succ;
	}

	public void setSucc(String succ) {
		this.succ = succ;
	}

}
