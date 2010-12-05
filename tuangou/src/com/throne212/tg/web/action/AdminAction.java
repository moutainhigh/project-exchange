package com.throne212.tg.web.action;

public class AdminAction  extends BaseAction{

	public String index(){
		logger.debug("进入管理首页");
		return "index";
	}

}
