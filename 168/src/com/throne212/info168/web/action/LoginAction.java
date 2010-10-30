package com.throne212.info168.web.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.info168.web.biz.UserBiz;
import com.throne212.info168.web.common.Util;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.domain.Admin;
import com.throne212.info168.web.domain.User;

public class LoginAction extends BaseAction {

	private String username;// 用户名
	private String password;// 密码
	private String rand;// 验证码
	private String preUrl;// 超时请求路径

	private UserBiz userBiz;// 业务层的用户bean

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public String execute() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		boolean isResponseCorrect = RandAction.capService.validateResponseForID(session.getId(),rand);
		if (Util.isEmpty(rand) || !isResponseCorrect) {
			this.setMsg("验证码错误");
			return "fail";
		}
		if (Util.isEmpty(username) || Util.isEmpty(password)) {
			this.setMsg("请完整填入用户名和密码");
			return "fail";
		}
		User user = userBiz.login(username, password);
		if (user == null) {
			msg = "登录失败，请检查用户名和密码";
			return "fail";
		}
		ActionContext.getContext().getSession().put(WebConstants.SESS_USER_OBJ, user);
		if (user instanceof Admin) {
			logger.info("超级管理员登录成功：" + user.getLoginName());
			return "admin";
		}
		if (!Util.isEmpty(preUrl)) {
			String cPath = ServletActionContext.getServletContext().getContextPath();
			if (cPath != null && !cPath.equals("/")) {
				preUrl = preUrl.replace(cPath, "");
			}
			return "pre_url";
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

	public String getPreUrl() {
		return preUrl;
	}

	public void setPreUrl(String preUrl) {
		this.preUrl = preUrl;
	}

}
