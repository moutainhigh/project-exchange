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
	private Integer userNo;// ����
	private String userId;// ��¼��
	private String userEmail;// email
	private Timestamp userRegdate;// ע��ʱ��
	private Timestamp userLastdate;// ����¼ʱ��
	private String userPassword;// ����
	private Timestamp userUpdate;// ����޸�����ʱ��
	private String userName;// ����
	private String userSex;// �У�Ů
	private String userBrief;// ���ҽ��ܣ����
	private String userDigree;// ѧ��
	private String userIslock;// �Ƿ�����,1������0δ����
	private String userAddress;// ��ϵ��ַ
	private String userPhone;// �绰
	private String userQq;// qq
	private String userMobile;// �ֻ�����
	private BigDecimal userAccount;// �˻����
	private Integer userScore;// ����
	private String userFileName;// ͷ��
	private String userIsvip;// 1ΪVIP��0����
	private String userAge;// ����
	private String userPost;//��������
	
	private String userSecret;//�Ƿ��ܣ�1���ܣ�0������
	private String userCityId;//��ס����
	private String userSign;//��ǩ��

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