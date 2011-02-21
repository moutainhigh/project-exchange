package com.throne212.siliao.domain;

import java.io.Serializable;

import com.throne212.siliao.common.WebConstants;

//用户的抽象类
public abstract class User extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	private String loginName;// 登录名
	private String password;// 密码
	private String email;// 邮件地址
	private String name;// 姓名
	private String remark;// 备注
	private String tel;// 电话号码
	private Integer age;// 年龄
	private Boolean gender;// 性别
	private String address;// 地址
	private String post;// 邮编

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getUserRole(){
		if(this instanceof Admin){
			return WebConstants.USER_NAME_ADMIN;
		}else if(this instanceof AreaAccount){
			return WebConstants.USER_NAME_AREA;
		}if(this instanceof ManagerAccount){
			return WebConstants.USER_NAME_MANAGER;
		}if(this instanceof ProviderAccount){
			return WebConstants.USER_NAME_PROVIDER;
		}else{
			return "";
		}
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
