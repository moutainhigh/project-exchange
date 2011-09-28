package com.throne212.jianzhi8.action;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.throne212.jianzhi8.biz.UserBiz;
import com.throne212.jianzhi8.domain.User;

@Results({ 
	@Result(name = "success", location = "/index.jsp"), 
	@Result(name = "login", location = "/login.jsp") 
})
public class LoginAction extends ActionSupport {

	private Logger logger = Logger.getLogger(this.getClass());
	
	public LoginAction() {
		logger.debug("init login action...");
	}

	private UserBiz userBiz;

	@Autowired
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	} 

	@Action("login")
	public String login() throws Exception{
		logger.debug("login...");
		userBiz.login("sa", "123");
		return "success";
	}
	
	@Action("reg")
	public String reg() throws Exception{
		logger.debug("reg...");
		User user = userBiz.reg("sa", "123");
		logger.info("login succ: " + user.getUserId());
		return "success";
	}

	@Override
	public String execute() throws Exception {
		logger.debug("exe...");
		return super.execute();
	}

}
