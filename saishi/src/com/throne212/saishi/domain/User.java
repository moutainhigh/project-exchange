package com.throne212.saishi.domain;

import java.io.Serializable;

import com.throne212.saishi.common.WebConstants;




//用户的抽象类
public class User extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	private String loginName;// 登录名
	private String password;// 密码

	private String name;// 姓名
	private String remark;// 备注

	public User() {
		super();
	}
	
	public String getUserRole(){
		if(this instanceof Admin){
			return WebConstants.USER_NAME_ADMIN;
		}else if(this instanceof Manager){
			return WebConstants.USER_NAME_MANAGER;
		}else{
			return "";
		}
	}
	
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}



}
