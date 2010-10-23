package com.throne212.info168.web.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.info168.web.biz.UserBiz;
import com.throne212.info168.web.common.Util;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.domain.User;

public class UserAction extends BaseAction{

	private UserBiz userBiz;

	//用户bean
	private User user;
	private String rand;
	private Long topArea; 
	
	//注册
	public String reg() {
		if(Util.isEmpty(rand)){
			this.setMsg("验证码为空");
			return "fail";
		}
		if(!rand.equals(ActionContext.getContext().getSession().get(WebConstants.SESS_RAND))){
			this.setMsg("验证码不一致");
			return "fail";
		}
		user = userBiz.regUser(user,topArea);
		return "succ";
	}
	
	//修改密码
	private String oldPwd;
	private String newPwd;
	public String changePwd(){
		User sessUser = (User) ActionContext.getContext().get(WebConstants.SESS_USER_OBJ);
		user = userBiz.login(sessUser.getLoginName(), oldPwd);
		if(user == null){
			this.setMsg("旧密码错误");
			return "fail";
		}
		if(userBiz.changePwd(sessUser, newPwd)){
			return "success";
		}
		return "fail";
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

	public String getOldPwd() {
		return oldPwd;
	}

	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

}
