package com.throne212.jianzhi8.action;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;

public class SearchAction extends ActionSupport {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	public String execute(){
		return "search";
	}

}
