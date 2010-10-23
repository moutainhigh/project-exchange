package com.throne212.info168.web.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.info168.web.biz.CommonBiz;
import com.throne212.info168.web.biz.UserBiz;
import com.throne212.info168.web.common.Util;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.domain.Area;
import com.throne212.info168.web.domain.User;

public class AjaxAction extends BaseAction {

	/* 通用的变量 */
	private List list;

	private UserBiz userBiz;
	private CommonBiz commonBiz;

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
		String sessRand = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_RAND);
		if (Util.isEmpty(rand) || Util.isEmpty(sessRand) || !rand.equals(sessRand))
			this.setMsg("fail");
		else
			this.setMsg("succ");
		return "msg";
	}

	// 获取省份数据
	public String getTopArea() {
		list = (List) ActionContext.getContext().getApplication().get(WebConstants.TOP_AREA_LIST);
		if (list == null) {
			list = commonBiz.getTopArea();
			ActionContext.getContext().getApplication().put(WebConstants.TOP_AREA_LIST, list);
		}
		return "area_list";
	}
	// 获取城市数据
	private Long parentId;
	public String getCities() {
		list = commonBiz.get2ndArea(parentId);
		return "area_list";
	}

	/* setters and getters */

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

	public CommonBiz getCommonBiz() {
		return commonBiz;
	}

	public void setCommonBiz(CommonBiz commonBiz) {
		this.commonBiz = commonBiz;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getRand() {
		return rand;
	}

	public void setRand(String rand) {
		this.rand = rand;
	}

}