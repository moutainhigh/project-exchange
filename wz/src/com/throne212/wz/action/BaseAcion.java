package com.throne212.wz.action;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.Action;
/**
 * 
 * <br>
 *Purpose : This Action Class is the parent Class for all Action Classes.
 *
 */
public class BaseAcion implements Action {
	
	protected Logger logger = Logger.getLogger(this.getClass());
	protected String msg; // validate message

	public String execute() {
		return "success";
	}

	public Logger getLogger() {
		return logger;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
