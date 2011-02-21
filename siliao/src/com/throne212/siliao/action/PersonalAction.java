package com.throne212.siliao.action;

import java.util.Date;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.siliao.biz.UserBiz;
import com.throne212.siliao.common.EncryptUtil;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.domain.User;
import com.throne212.siliao.domain.UserLog;

public class PersonalAction extends BaseAction {
	private UserBiz userBiz;

	// 密码页面
	public String password() {
		return "password";
	}

	// 修改密码
	private String oldpassword;
	private String newpassword;
	private String renewpassword;

	public String changePwd() {
		if (Util.isEmpty(oldpassword) || Util.isEmpty(newpassword) || Util.isEmpty(renewpassword)) {
			this.setMsg("请完整输入所有密码输入框");
		} else if (newpassword.length() < 6 || renewpassword.length() < 6) {
			this.setMsg("密码长度不小于6");
		} else if (!newpassword.equals(renewpassword)) {
			this.setMsg("两次新密码输入不一致");
		} else {
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			if (!oldpassword.equals(user.getPassword()) && !EncryptUtil.md5Encode(oldpassword).equals(user.getPassword())) {
				this.setMsg("原密码错误");
			} else {
				user.setPassword(EncryptUtil.md5Encode(newpassword));
				userBiz.saveOrUpdateEntity(user);
				ActionContext.getContext().getSession().put(WebConstants.SESS_USER_OBJ, user);
				this.setMsg("密码修改成功");
			}
		}
		return "password";
	}

	// 信息补全
	private String email;
	private String tel;
	private Integer age;
	private Boolean gender;
	private String address;
	private String post;
	
	private User user;

	//信息补全
	public String modifyUser() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user == null) {
			this.setMsg("请先登录！");
			return "fail";

		}
		User userForModifyUser = userBiz.getEntityByUnique(User.class, "loginName", user.getLoginName());
		userForModifyUser.setEmail(email);
		userForModifyUser.setTel(tel);
		userForModifyUser.setAge(age);
		userForModifyUser.setAddress(address);
		userForModifyUser.setPost(post);
		userForModifyUser.setGender(gender);

		userBiz.saveOrUpdateEntity(userForModifyUser);
		
		UserLog log=new UserLog();
		log.setByWho(user);
		log.setCreateDate(new Date());
		log.setCreateName(user.getName());
		log.setEnable(true);
		log.setLogTime(new Date());
		log.setMsg(WebConstants.OP_UPDATE);
		log.setUser(user);
		userBiz.saveOrUpdateEntity(log);
		
		
		
		
		this.setMsg("修改成功！");
		ActionContext.getContext().getSession().put(WebConstants.SESS_USER_OBJ, userForModifyUser);
		
		return "user_info";
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public String getOldpassword() {
		return oldpassword;
	}

	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String getRenewpassword() {
		return renewpassword;
	}

	public void setRenewpassword(String renewpassword) {
		this.renewpassword = renewpassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

}
