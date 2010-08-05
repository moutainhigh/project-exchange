package com.throne212.auto.action;

import com.throne212.auto.biz.UserBiz;
import com.throne212.auto.common.Util;
import com.throne212.auto.domain.User;

public class ManageAction extends BaseAction {
	
	private UserBiz userBiz;

	public String execute(){
		return "main";
	}
	public String index(){
		return "main";
	}
	private User user;
	private String oldPwd;
	private String newPwd2;
	private String newPwd;
	public String chgPwd(){
		if(Util.isEmpty(oldPwd) || Util.isEmpty(newPwd2) || Util.isEmpty(newPwd)){
			this.setReqMsg("密码输入不完整，请重新输入");
		}else if(!newPwd.equals(newPwd2)){
			this.setReqMsg("两次密码输入不一致");
		}else if(!userBiz.changePwd(user.getId(), oldPwd, newPwd)){
			this.setReqMsg("密码修改失败，请检查原密码是否输入正确");
		}else{
			this.setReqMsg("密码修改成功");
		}
		return "pwd";
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
	public String getNewPwd2() {
		return newPwd2;
	}
	public void setNewPwd2(String newPwd2) {
		this.newPwd2 = newPwd2;
	}
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	public UserBiz getUserBiz() {
		return userBiz;
	}

}
