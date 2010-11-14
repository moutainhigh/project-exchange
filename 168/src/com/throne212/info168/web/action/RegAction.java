package com.throne212.info168.web.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.info168.web.biz.UserBiz;
import com.throne212.info168.web.common.Util;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.domain.User;

public class RegAction extends BaseAction {

	private UserBiz userBiz;
	// 用户bean
	private User user;
	private String rand;
	private Long topArea;

	// 注册
	public String execute() {
		if (Util.isEmpty(rand)) {
			this.setMsg("验证码为空");
			return "fail";
		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		//boolean isResponseCorrect = RandAction.capService.validateResponseForID(session.getId(),rand);
		Boolean isResponseCorrect = (Boolean) session.getAttribute("isResponseCorrect");
		if (isResponseCorrect==null || !isResponseCorrect) {
			this.setMsg("验证码不一致");
			return "fail";
		}
		//检查登录名唯一性
		User loginNameUser = userBiz.getEntityByUnique(User.class, "loginName", user.getLoginName());
		if(loginNameUser != null){
			this.setMsg("登录名已经存在");
			return "fail";
		}
		//检查邮箱地址唯一性
		User emailUser = userBiz.getEntityByUnique(User.class, "email", user.getEmail());
		if(emailUser != null){
			this.setMsg("邮箱地址已经被别人使用了");
			return "fail";
		}
		
		user = userBiz.regUser(user, topArea);
		ActionContext.getContext().getSession().put(WebConstants.SESS_USER_OBJ, user);
		return "success";
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getRand() {
		return rand;
	}

	public void setRand(String rand) {
		this.rand = rand;
	}

	public Long getTopArea() {
		return topArea;
	}

	public void setTopArea(Long topArea) {
		this.topArea = topArea;
	}
}
