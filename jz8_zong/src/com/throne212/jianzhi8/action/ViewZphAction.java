package com.throne212.jianzhi8.action;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;

public class ViewZphAction extends ActionSupport {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	private int zphNo;
	
	public String execute(){
		return "view_zph";
	}

	public int getZphNo() {
		return zphNo;
	}

	public void setZphNo(int zphNo) {
		this.zphNo = zphNo;
	}
	
}
