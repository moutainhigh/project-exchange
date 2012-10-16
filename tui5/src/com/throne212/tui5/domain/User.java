package com.throne212.tui5.domain;

// default package

import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 * User entity. @author Yang Lei
 */

public class User implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1269513210464697370L;
	private Integer userNo;// 主键
	private String userId;// 登录名
	private String userEmail;// email
	private Timestamp userRegdate;// 注册时间
	private Timestamp userLastdate;// 最后登录时间
	private String userPassword;// 密码
	private Timestamp userUpdate;// 最后修改资料时间
	private String userName;// 姓名
	private String userSex;// 男，女
	private String userBrief;// 自我介绍，简介
	private String userDigree;// 学历
	private String userIslock;// 是否被锁定,1锁定，0未锁定
	private String userAddress;// 联系地址
	private String userPhone;// 电话
	private String userQq;// qq
	private String userMobile;// 手机号码
	private BigDecimal userAccount;// 账户余额
	private Integer userScore;// 积分
	private String userFileName;// 头像
	private String userIsvip;// 1为VIP，0不是
	private String userAge;// 年龄
	private String userPost;//邮政编码
	
	private String userSecret;//是否保密，1保密，0不保密
	private String userCityId;//常住地区
	private String userSign;//行签名

	public Integer getUserNo() {
		return userNo;
	}

	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Timestamp getUserRegdate() {
		return userRegdate;
	}

	public void setUserRegdate(Timestamp userRegdate) {
		this.userRegdate = userRegdate;
	}

	public Timestamp getUserLastdate() {
		return userLastdate;
	}

	public void setUserLastdate(Timestamp userLastdate) {
		this.userLastdate = userLastdate;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public Timestamp getUserUpdate() {
		return userUpdate;
	}

	public void setUserUpdate(Timestamp userUpdate) {
		this.userUpdate = userUpdate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserBrief() {
		return userBrief;
	}

	public void setUserBrief(String userBrief) {
		this.userBrief = userBrief;
	}

	public String getUserDigree() {
		return userDigree;
	}

	public void setUserDigree(String userDigree) {
		this.userDigree = userDigree;
	}

	public String getUserIslock() {
		return userIslock;
	}

	public void setUserIslock(String userIslock) {
		this.userIslock = userIslock;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserQq() {
		return userQq;
	}

	public void setUserQq(String userQq) {
		this.userQq = userQq;
	}

	public String getUserMobile() {
		return userMobile;
	}

	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}

	public BigDecimal getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(BigDecimal userAccount) {
		this.userAccount = userAccount;
	}

	public Integer getUserScore() {
		return userScore;
	}

	public void setUserScore(Integer userScore) {
		this.userScore = userScore;
	}

	public String getUserFileName() {
		return userFileName;
	}

	public void setUserFileName(String userFileName) {
		this.userFileName = userFileName;
	}

	public String getUserIsvip() {
		return userIsvip;
	}

	public void setUserIsvip(String userIsvip) {
		this.userIsvip = userIsvip;
	}

	public String getUserAge() {
		return userAge;
	}

	public void setUserAge(String userAge) {
		this.userAge = userAge;
	}

	public String getUserPost() {
		return userPost;
	}

	public void setUserPost(String userPost) {
		this.userPost = userPost;
	}

	public String getUserSecret() {
		return userSecret;
	}

	public void setUserSecret(String userSecret) {
		this.userSecret = userSecret;
	}

	public String getUserCityId() {
		return userCityId;
	}

	public void setUserCityId(String userCityId) {
		this.userCityId = userCityId;
	}

	public String getUserSign() {
		return userSign;
	}

	public void setUserSign(String userSign) {
		this.userSign = userSign;
	}

}