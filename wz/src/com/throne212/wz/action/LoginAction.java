package com.throne212.wz.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.wz.biz.UserBiz;
import com.throne212.wz.common.Consts;
import com.throne212.wz.common.Util;
import com.throne212.wz.domain.User;

public class LoginAction extends BaseAcion {

	private UserBiz userBiz;
	
	private String username;
	private String password;
	private String rand;

	@Autowired
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	} 

	public String execute(){
		if(Util.isEmpty(username) || Util.isEmpty(password) || Util.isEmpty(rand)){
			this.setMsg("参数错误，请检查!");
			return "fail";
		}
		String randInSess = (String) ActionContext.getContext().getSession().get(Consts.SESS_RAND);
		if(!rand.equals(randInSess)){
			this.setMsg("验证码错误!");
			return "fail";
		}
		User user = userBiz.login(username, password);
		if(user == null){
			this.setMsg("登录失败，请检查用户名和密码!");
			return "fail";
		}
		ActionContext.getContext().getSession().put(Consts.SESS_USER_OBJ, user);
		return "success";
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRand() {
		return rand;
	}

	public void setRand(String rand) {
		this.rand = rand;
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}
	
}
