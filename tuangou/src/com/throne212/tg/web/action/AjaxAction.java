package com.throne212.tg.web.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.throne212.tg.web.biz.UserBiz;
import com.throne212.tg.web.common.Util;
import com.throne212.tg.web.domain.User;

public class AjaxAction extends BaseAction {

	/* 通用的变量 */
	private List list;

	private UserBiz userBiz;

	// ajax检查登录名是否重复
	private String loginName;

	public String checkLoginName() {
		boolean rst = userBiz.checkUnique(User.class, "loginName", loginName);
		if (rst == true)
			this.setMsg("succ");
		else
			this.setMsg("fail");
		return "msg";
	}

	// ajax检查邮箱是否重复
	private String email;

	public String checkEmail() {
		boolean rst = userBiz.checkUnique(User.class, "email", email);
		if (rst == true)
			this.setMsg("succ");
		else
			this.setMsg("fail");
		return "msg";
	}

	// ajax检查验证码是否正确
	private String rand;

	public String checkRand() {
		// String sessRand = (String)
		// ActionContext.getContext().getSession().get(WebConstants.SESS_RAND);
		HttpSession session = ServletActionContext.getRequest().getSession();
		boolean isResponseCorrect = RandAction.capService.validateResponseForID(session.getId(), rand);
		// String r = RandAction.capService.getQuestionForID(session.getId());
		if (!Util.isEmpty(rand) && isResponseCorrect) {
			this.setMsg("succ");
			session.setAttribute("isResponseCorrect", isResponseCorrect);
		} else
			this.setMsg("fail");
		return "msg";
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRand() {
		return rand;
	}

	public void setRand(String rand) {
		this.rand = rand;
	}

}
