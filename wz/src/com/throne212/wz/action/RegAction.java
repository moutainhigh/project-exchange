package com.throne212.wz.action;

import java.sql.Timestamp;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.wz.biz.UserBiz;
import com.throne212.wz.common.Consts;
import com.throne212.wz.common.Util;
import com.throne212.wz.domain.User;

public class RegAction extends BaseAcion {

	private UserBiz userBiz;
	
	private String rand;
	private User user;

	@Autowired
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	} 

	public String execute(){
		if(user == null || Util.isEmpty(user.getUserId()) || Util.isEmpty(user.getUserPassword()) || Util.isEmpty(user.getUserEmail()) || Util.isEmpty(rand)){
			this.setMsg("参数错误，请检查，用户名、密码和邮箱是必填项!");
			return "fail";
		}
		String randInSess = (String) ActionContext.getContext().getSession().get(Consts.SESS_RAND);
		if(!rand.equals(randInSess)){
			this.setMsg("验证码错误!");
			return "fail";
		}
		user.setUserContact("");
		user.setUserRegdate(new Timestamp(System.currentTimeMillis()));
		user.setUserLastdate(new Timestamp(System.currentTimeMillis()));
		user.setUserUpdate(new Timestamp(System.currentTimeMillis()));
		user.setUserIscheck("0");
		user.setUserIpaddr(ServletActionContext.getRequest().getRemoteHost());
		user = userBiz.reg(user);
		if(user == null){
			this.setMsg("注册失败，用户名或邮箱已经存在!");
			return "fail";
		}
		ActionContext.getContext().getSession().put(Consts.SESS_USER_OBJ, user);
		ActionContext.getContext().getSession().put(Consts.SESS_RAND, null);
		this.setMsg("注册成功");
		return "success";
	}

	public String getRand() {
		return rand;
	}

	public void setRand(String rand) {
		this.rand = rand;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}
	
}
