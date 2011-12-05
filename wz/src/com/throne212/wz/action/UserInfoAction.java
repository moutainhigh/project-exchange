package com.throne212.wz.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.wz.biz.UserBiz;
import com.throne212.wz.common.Consts;
import com.throne212.wz.common.Util;
import com.throne212.wz.domain.User;

public class UserInfoAction extends BaseAcion {

	private UserBiz userBiz;
	
	private User user;

	@Autowired
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	} 

	//后台首页
	public String index(){
		return "index";
	}
	
	//修改密码
	private String oldPwd;
	private String newPwd;
	private String newPwd2;
	public String changePwd() throws Exception {
		if (user == null) {
			user = (User) ActionContext.getContext().getSession().get(Consts.SESS_USER_OBJ);
		}
		if (Util.isEmpty(oldPwd) || Util.isEmpty(newPwd2) || Util.isEmpty(newPwd)) {
			this.setMsg("密码输入不完整，请重新输入");
			return "change_pwd";
		} else if (!newPwd.equals(newPwd2)) {
			this.setMsg("两次密码输入不一致");
			return "change_pwd";
		} else if (!userBiz.changePwd(user.getUserId(), oldPwd, newPwd)) {
			this.setMsg("密码修改失败，请检查原密码是否输入正确");
			return "change_pwd";
		} else {
			this.setMsg("密码修改成功");
		}
		return "change_pwd";
	}
	
	//修改账户资料
	private String nickName;
	private String email;
	private String qq;
	private String tel; 
	public String changeUserInfo() throws Exception {
		if (Util.isEmpty(email) || Util.isEmpty(nickName)) {
			this.setMsg("邮箱地址和昵称不可为空！");
			return "account_info";
		}
		if (user == null) 
			user = (User) ActionContext.getContext().getSession().get(Consts.SESS_USER_OBJ);
		user = userBiz.changeUserInfo(user.getUserId(), nickName, email, qq, tel);
        ActionContext.getContext().getSession().put(Consts.SESS_USER_OBJ, user);
        this.setMsg("修改资料成功！");
		return "account_info";
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

	public String getOldPwd() {
		return oldPwd;
	}

	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getNewPwd2() {
		return newPwd2;
	}

	public void setNewPwd2(String newPwd2) {
		this.newPwd2 = newPwd2;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
