package com.throne212.tui5.action;


public class RegAction extends BaseAction {
	
	public String execute() {
		logger.debug("into reg.html");
		if("ok".equals(params)){
			return "reg_ok";
		}else{
			return "reg";
		}
	}
}
