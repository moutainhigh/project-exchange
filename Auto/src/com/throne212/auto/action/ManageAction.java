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
			this.setReqMsg("�������벻����������������");
		}else if(!oldPwd.equals(newPwd2)){
			this.setReqMsg("�����������벻һ��");
		}else if(!userBiz.changePwd(user.getId(), oldPwd, newPwd)){
			this.setReqMsg("�����޸�ʧ�ܣ�����ԭ�����Ƿ�������ȷ");
		}
		return "pwd";
	}
	
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

}
