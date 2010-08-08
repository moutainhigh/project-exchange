package com.throne212.auto.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.auto.biz.UserBiz;
import com.throne212.auto.common.WebConstants;
import com.throne212.auto.domain.Admin;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.User;

public class LoginAction extends BaseAction {

	private String username;

	private String password;

	private String rand;

	private UserBiz userBiz;

	public String execute() throws Exception {
		logger.info("[login action start]-----username:[" + username + "]");
		String sessRand = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_RAND);
		if (rand == null || !rand.equals(sessRand)) {
			this.setReqMsg("验证码错误");
			return ERROR;
		}
		User user = userBiz.login(username, password);
		if (user != null) {/* login successfully */
			logger.info("loginName=[" + username + "] login successfully");
			// add user name
			ActionContext.getContext().getSession().put(WebConstants.SESS_USER_NAME, user.getLoginName());
			ActionContext.getContext().getSession().put(WebConstants.SESS_USER_OBJ, user);
			if(user instanceof Admin){
				ActionContext.getContext().getSession().put(WebConstants.SESS_USER_IS_ADMIN,true);
			}else if(user instanceof Sale){
				ActionContext.getContext().getSession().put(WebConstants.SESS_USER_IS_ADMIN,false);
			}
		} else {/* login failed */
			logger.info("loginName=[" + username + "] login failed");
			this.setReqMsg("登录失败，请检查用户名和密码");
			return ERROR;
		}
		return SUCCESS;
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

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
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
