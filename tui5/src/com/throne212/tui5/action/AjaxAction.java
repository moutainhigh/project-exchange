package com.throne212.tui5.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tui5.biz.BaseBiz;
import com.throne212.tui5.common.EncryptUtil;
import com.throne212.tui5.common.Util;
import com.throne212.tui5.domain.User;


public class AjaxAction extends BaseAction {

	@Autowired
	private BaseBiz baseBiz;
	
	protected String msg;
	
	//check
	private String username;
	private String email;
	private String password;
	private String password2;
	private String rand;
	public String checkUserName(){
		User user = baseBiz.getEntityByUnique(User.class, "userId", username);
		if(user == null)
			msg = "Y";
		else
			msg = "N";
		return "msg";
	}	
	public String checkEmail(){
		User user = baseBiz.getEntityByUnique(User.class, "userEmail", email);
		if(user == null)
			msg = "Y";
		else
			msg = "N";
		return "msg";
	}
	public String addUser(){
		String randInSess = (String) ActionContext.getContext().getSession().get("rand");
		if(rand == null || !rand.equals(randInSess)){
			msg = "验证码错误";
		} else if(!Util.isEmpty(username) 
				&& !Util.isEmpty(email) 
				&& !Util.isEmpty(password)
				&& !Util.isEmpty(password2)
				&& password.equals(password2)){
			User user = new User();
			user.setUserId(username);
			user.setUserPassword(EncryptUtil.md5Encode(password));
			user.setUserEmail(email);
			baseBiz.saveOrUpdateEntity(user);
			msg = "Y";
		}else{
			msg = "数据错误，请检查";
		}
		return "msg";
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public String getRand() {
		return rand;
	}
	public void setRand(String rand) {
		this.rand = rand;
	}

}
