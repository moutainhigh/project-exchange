package com.throne212.fupin.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.UserBiz;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Admin;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.ZhenWorkOrg;


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
		/*
		 * HttpSession session = ServletActionContext.getRequest().getSession();
		 * boolean isResponseCorrect =
		 * RandAction.capService.validateResponseForID(session.getId(),rand); if
		 * (Util.isEmpty(rand) || !isResponseCorrect) { this.setMsg("验证码错误");
		 * return "fail"; }
		 */
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
		} else if (user instanceof ShiWorkOrg) {
			logger.info("市管理员登录成功：" + user.getLoginName());
		} else if (user instanceof AreaWorkOrg) {
			logger.info("区县管理员登录成功：" + user.getLoginName());
		} else if (user instanceof ZhenWorkOrg) {
			logger.info("镇管理员登录成功：" + user.getLoginName());
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
