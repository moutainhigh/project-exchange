package com.throne212.jianzhi8.dataobject;

import java.util.Date;

import com.throne212.jianzhi8.common.Util;

//简历列表页专用
public class ResumeDO {

	private String userNo;
	private String userId;
	private String userName;
	private String userClass;
	private String userKind;
	private String typeName;
	private String sex;
	private String age;
	private String cityCode;
	private String cityName;
	private String shenfen;
	private Date date;
	
	public String getArea(){
		if(!Util.isEmpty(cityCode) && cityCode.length() == 6 && !Util.isEmpty(cityName)){
			return cityName.split(",")[1];
		}
		return null;
	}
	
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserClass() {
		return userClass;
	}
	public void setUserClass(String userClass) {
		this.userClass = userClass;
	}
	public String getUserKind() {
		return userKind;
	}
	public void setUserKind(String userKind) {
		this.userKind = userKind;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getShenfen() {
		return shenfen;
	}
	public void setShenfen(String shenfen) {
		this.shenfen = shenfen;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getCityCode() {
		return cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	
}
