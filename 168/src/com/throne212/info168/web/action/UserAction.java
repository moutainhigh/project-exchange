package com.throne212.info168.web.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.info168.web.biz.UserBiz;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.domain.Info;
import com.throne212.info168.web.domain.User;

public class UserAction extends BaseAction{

	private UserBiz userBiz;

	//用户bean
	private User user;
	
	
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
	
	//信息列表
	private List<Info> infoList;
	public String infoList(){
				
		return "info_list";
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

	public List<Info> getInfoList() {
		return infoList;
	}

	public void setInfoList(List<Info> infoList) {
		this.infoList = infoList;
	}

}
