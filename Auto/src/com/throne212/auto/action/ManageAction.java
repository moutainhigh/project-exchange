package com.throne212.auto.action;

import com.throne212.auto.biz.UserBiz;
import com.throne212.auto.common.Util;
import com.throne212.auto.domain.User;

public class ManageAction extends BaseAction {
	
	private UserBiz userBiz;

	public String execute(){
		return "index";
	}
	
	private User user;
	private String oldPwd;
	private String newPwd2;
	private String newPwd;
	public String chgPwd(){
		if(Util.isEmpty(oldPwd) || Util.isEmpty(newPwd2) || Util.isEmpty(newPwd)){
			this.setReqMsg("密码输入不完整，请重新输入");
		}else if(!oldPwd.equals(newPwd2)){
			this.setReqMsg("两次密码输入不一致");
		}else if(!userBiz.changePwd(user.getId(), oldPwd, newPwd)){
			this.setReqMsg("密码修改失败，请检查原密码是否输入正确");
		}
		return "pwd";
	}
	
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

}
