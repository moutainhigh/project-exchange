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
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.ZhenWorkOrg;

public class LoginAction extends BaseAction {

	private String username;// 用户名
	private String password;// 密码
	private String rand;// 验证码
	private String needRand;// 需要验证码吗
	private Boolean remember;//记住密码
	
	private String lastUser;//之前的账户
	private String lastPwd;//之前的密码

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
		User oldUser = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		ActionContext.getContext().getSession().put(WebConstants.SESS_USER_OBJ, user);
		if (user instanceof Admin) {
			logger.info("超级管理员登录成功：" + user.getLoginName());

		} else if (user instanceof ShiWorkOrg) {
			logger.info("市管理员登录成功：" + user.getLoginName());
			ActionContext.getContext().getSession().put(WebConstants.SESS_FORWARD_URL, "../shenhe_showAllCuoshiCunInPro.action");
		} else if (user instanceof AreaWorkOrg) {
			AreaWorkOrg a = (AreaWorkOrg) user;
			if(username.equals(a.getLoginName2())){
				a.setIsWorkGroup("Y");
			}
			logger.info("区县管理员登录成功：" + user.getLoginName());
			ActionContext.getContext().getSession().put(WebConstants.SESS_FORWARD_URL, "../shenhe_showAllCuoshiCunInPro.action");
		} else if (user instanceof ZhenWorkOrg) {
			logger.info("镇管理员登录成功：" + user.getLoginName());
			ActionContext.getContext().getSession().put(WebConstants.SESS_FORWARD_URL, "../cun_cunList.action");
		} else if (user instanceof Org) {
			logger.info("帮扶单位管理员登录成功：" + user.getLoginName());
			if ("N".equals(needRand)) {
				user.setIsSA("Y");//sa用单位账户登录的
				lastUser = oldUser.getLoginName();
				lastPwd = oldUser.getPassword();
				ActionContext.getContext().getSession().put("last", "Y");
				ActionContext.getContext().getSession().put("lastUser", lastUser);
				ActionContext.getContext().getSession().put("lastPwd", lastPwd);
			}
			ActionContext.getContext().getSession().put(WebConstants.SESS_FORWARD_URL, "../org_editOrg.action");
			checkOrgCun((Org) user);
		}
		//保留cookie
		HttpServletResponse response = ServletActionContext.getResponse();
		if(remember != null && remember){
			Cookie c = new Cookie("username",username);
			c.setMaxAge(30*24*60*60);
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

	public String getLastUser() {
		return lastUser;
	}

	public void setLastUser(String lastUser) {
		this.lastUser = lastUser;
	}

	public String getLastPwd() {
		return lastPwd;
	}

	public void setLastPwd(String lastPwd) {
		this.lastPwd = lastPwd;
	}

}
