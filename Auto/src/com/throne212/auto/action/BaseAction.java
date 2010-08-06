package com.throne212.auto.action;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;

public abstract class BaseAction extends ActionSupport {
	protected Logger logger = Logger.getLogger(this.getClass());
	
	protected String reqStatus;
	protected String reqMsg;

	public String getReqStatus() {
		return reqStatus;
	}

	public void setReqStatus(String reqStatus) {
		this.reqStatus = reqStatus;
	}

	public String getReqMsg() {
		return reqMsg;
	}

	public void setReqMsg(String reqMsg) {
		this.reqMsg = reqMsg;
	}

}
