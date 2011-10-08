package com.throne212.fupin.action;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.UserBiz;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Admin;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.ProjectCun;
import com.throne212.fupin.domain.ProjectShehui;
import com.throne212.fupin.domain.ProjectZhongdian;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.ZhenWorkOrg;

public class LoginAction extends BaseAction {

	private String username;// 用户名
	private String password;// 密码
	private String rand;// 验证码
	private String needRand;// 需要验证码吗
	private Boolean remember;// 记住密码

	private UserBiz userBiz;// 业务层的用户bean

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public String execute() {
		// 验证码略去
		if (!"N".equals(needRand)) {
			String randInSess = (String) ActionContext.getContext().getSession().get("rand");
			if (Util.isEmpty(rand) || !rand.equals(randInSess)) {
				this.setMsg("验证码错误");
				return "fail";
			}
		}

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
			ActionContext.getContext().getSession().put(WebConstants.SESS_FORWARD_URL, "../shenhe_showAllCuoshiCunInPro.action");
		} else if (user instanceof AreaWorkOrg) {
			AreaWorkOrg a = (AreaWorkOrg) user;
			if (username.equals(a.getLoginName2())) {
				a.setIsWorkGroup("Y");
			}
			logger.info("区县管理员登录成功：" + user.getLoginName());
			ActionContext.getContext().getSession().put(WebConstants.SESS_FORWARD_URL, "../shenhe_showAllCuoshiCunInPro.action");
		} else if (user instanceof ZhenWorkOrg) {
			logger.info("镇管理员登录成功：" + user.getLoginName());
			ActionContext.getContext().getSession().put(WebConstants.SESS_FORWARD_URL, "../cun_cunList.action");
		} else if (user instanceof Org) {
			logger.info("帮扶单位管理员登录成功：" + user.getLoginName());
			ActionContext.getContext().getSession().put(WebConstants.SESS_FORWARD_URL, "../org_editOrg.action");
			checkOrgCun((Org) user);
			fillOrgHelpType((Org) user);
		}

		// 保留cookie
		HttpServletResponse response = ServletActionContext.getResponse();
		if (remember != null && remember) {
			Cookie c = new Cookie("username", username);
			c.setMaxAge(30 * 24 * 60 * 60);
			response.addCookie(c);
		}
		return "success";
	}

	// 修复单位没有保存
	private void checkOrgCun(Org org) {
		if (org.getCun() == null) {
			List<Cun> list = userBiz.getEntitiesByColumn(Cun.class, "org", org);
			if (list != null && list.size() > 0) {
				logger.info("数据bug修复，村与单位的映射缺失");
				org.setCun(list.get(0));
				userBiz.saveOrUpdateEntity(org);
			}
		}
	}

	public void fillOrgHelpType(Org org) {
		List cunProj = userBiz.getEntitiesByColumn(ProjectCun.class, "org", org);
		List zdProj = userBiz.getEntitiesByColumn(ProjectZhongdian.class, "org", org);
		List shProj = userBiz.getEntitiesByColumn(ProjectShehui.class, "org", org);
		if (cunProj == null && zdProj == null && shProj == null) {
			org.setHelpFamily(true);
		}
		if (zdProj != null && zdProj.size() > 0) {
			org.setHelpZhen(true);
		}
		if (cunProj != null && cunProj.size() > 0) {
			org.setHelpCun(true);
		}
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

	public String getNeedRand() {
		return needRand;
	}

	public void setNeedRand(String needRand) {
		this.needRand = needRand;
	}

	public Boolean getRemember() {
		return remember;
	}

	public void setRemember(Boolean remember) {
		this.remember = remember;
	}

}
