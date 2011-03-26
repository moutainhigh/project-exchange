package com.throne212.saishi.action;



import com.opensymphony.xwork2.ActionContext;
import com.throne212.saishi.biz.UserBiz;
import com.throne212.saishi.common.Util;
import com.throne212.saishi.common.WebConstants;
import com.throne212.saishi.domain.Admin;
import com.throne212.saishi.domain.Manager;
import com.throne212.saishi.domain.User;

public class LoginAction extends BaseAction {

	private String username;// 用户名
	private String password;// 密码
	private String rand;// 验证码

	private UserBiz userBiz;// 业务层的用户bean

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public String execute() {
		// 验证码略去

//		String randInSess = (String) ActionContext.getContext().getSession().get("rand");
//		if (Util.isEmpty(rand) || !rand.equals(randInSess)) {
//			this.setMsg("验证码错误");
//			return "fail";
//		}

		if (Util.isEmpty(username) || Util.isEmpty(password)) {
			this.setMsg("请完整填入用户名和密码");
			return "fail";
		}
		User user = userBiz.login(username, password);
		if (user == null) {
			this.setMsg("登录失败，请检查用户名和密码");
			return "fail";
		}
		ActionContext.getContext().getSession().put(WebConstants.SESS_USER_OBJ, user);
		if (user instanceof Admin) {
			logger.info("超级管理员登录成功：" + user.getLoginName());
		} else if (user instanceof Manager) {
			logger.info("管理员登录成功：" + user.getLoginName());
		}
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
