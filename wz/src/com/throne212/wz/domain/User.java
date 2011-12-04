package com.throne212.wz.domain;
// default package

import java.sql.Timestamp;


/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User  implements java.io.Serializable {


    // Fields    

     private Integer userNo;
     private String userId;
     private String userEmail;
     private String userContact;
     private Timestamp userRegdate;
     private Timestamp userLastdate;
     private String userIscheck;
     private String userPassword;
     private String userIpaddr;
     private Timestamp userUpdate;
     private String userName;
     private String userSex;
     private String userBrief;
     private String userDigree;
     private String userCompanyName;
     private String userKind;
     private String userIslock;
     private String userCityId;
     private String userCityName;
     private String userAddress;
     private String userQq;
     private String userPhone;
     private String userMobile;
     private Float userAccount;
     private String userIsyz;
     private Integer userScore;
     private String userFileName;
     private String userIsvip;
     private Integer userSuccess;
     private Integer userFailure;


    // Constructors

    /** default constructor */
    public User() {
    }

	/** minimal constructor */
    public User(String userId, String userEmail, String userContact, Timestamp userRegdate, Timestamp userLastdate, String userIscheck, String userPassword, String userIpaddr, Timestamp userUpdate) {
        this.userId = userId;
        this.userEmail = userEmail;
        this.userContact = userContact;
        this.userRegdate = userRegdate;
        this.userLastdate = userLastdate;
        this.userIscheck = userIscheck;
        this.userPassword = userPassword;
        this.userIpaddr = userIpaddr;
        this.userUpdate = userUpdate;
    }
    
    /** full constructor */
    public User(String userId, String userEmail, String userContact, Timestamp userRegdate, Timestamp userLastdate, String userIscheck, String userPassword, String userIpaddr, Timestamp userUpdate, String userName, String userSex, String userBrief, String userDigree, String userCompanyName, String userKind, String userIslock, String userCityId, String userCityName, String userAddress, String userQq, String userPhone, String userMobile, Float userAccount, String userIsyz, Integer userScore, String userFileName, String userIsvip, Integer userSuccess, Integer userFailure) {
        this.userId = userId;
        this.userEmail = userEmail;
        this.userContact = userContact;
        this.userRegdate = userRegdate;
        this.userLastdate = userLastdate;
        this.userIscheck = userIscheck;
        this.userPassword = userPassword;
        this.userIpaddr = userIpaddr;
        this.userUpdate = userUpdate;
        this.userName = userName;
        this.userSex = userSex;
        this.userBrief = userBrief;
        this.userDigree = userDigree;
        this.userCompanyName = userCompanyName;
        this.userKind = userKind;
        this.userIslock = userIslock;
        this.userCityId = userCityId;
        this.userCityName = userCityName;
        this.userAddress = userAddress;
        this.userQq = userQq;
        this.userPhone = userPhone;
        this.userMobile = userMobile;
        this.userAccount = userAccount;
        this.userIsyz = userIsyz;
        this.userScore = userScore;
        this.userFileName = userFileName;
        this.userIsvip = userIsvip;
        this.userSuccess = userSuccess;
        this.userFailure = userFailure;
    }

   
    // Property accessors

    public Integer getUserNo() {
        return this.userNo;
    }
    
    public void setUserNo(Integer userNo) {
        this.userNo = userNo;
    }

    public String getUserId() {
        return this.userId;
    }
    
    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserEmail() {
        return this.userEmail;
    }
    
    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserContact() {
        return this.userContact;
    }
    
    public void setUserContact(String userContact) {
        this.userContact = userContact;
    }

    public Timestamp getUserRegdate() {
        return this.userRegdate;
    }
    
    public void setUserRegdate(Timestamp userRegdate) {
        this.userRegdate = userRegdate;
    }

    public Timestamp getUserLastdate() {
        return this.userLastdate;
    }
    
    public void setUserLastdate(Timestamp userLastdate) {
        this.userLastdate = userLastdate;
    }

    public String getUserIscheck() {
        return this.userIscheck;
    }
    
    public void setUserIscheck(String userIscheck) {
        this.userIscheck = userIscheck;
    }

    public String getUserPassword() {
        return this.userPassword;
    }
    
    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserIpaddr() {
        return this.userIpaddr;
    }
    
    public void setUserIpaddr(String userIpaddr) {
        this.userIpaddr = userIpaddr;
    }

    public Timestamp getUserUpdate() {
        return this.userUpdate;
    }
    
    public void setUserUpdate(Timestamp userUpdate) {
        this.userUpdate = userUpdate;
    }

    public String getUserName() {
        return this.userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserSex() {
        return this.userSex;
    }
    
    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public String getUserBrief() {
        return this.userBrief;
    }
    
    public void setUserBrief(String userBrief) {
        this.userBrief = userBrief;
    }

    public String getUserDigree() {
        return this.userDigree;
    }
    
    public void setUserDigree(String userDigree) {
        this.userDigree = userDigree;
    }

    public String getUserCompanyName() {
        return this.userCompanyName;
    }
    
    public void setUserCompanyName(String userCompanyName) {
        this.userCompanyName = userCompanyName;
    }

    public String getUserKind() {
        return this.userKind;
    }
    
    public void setUserKind(String userKind) {
        this.userKind = userKind;
    }

    public String getUserIslock() {
        return this.userIslock;
    }
    
    public void setUserIslock(String userIslock) {
        this.userIslock = userIslock;
    }

    public String getUserCityId() {
        return this.userCityId;
    }
    
    public void setUserCityId(String userCityId) {
        this.userCityId = userCityId;
    }

    public String getUserCityName() {
        return this.userCityName;
    }
    
    public void setUserCityName(String userCityName) {
        this.userCityName = userCityName;
    }

    public String getUserAddress() {
        return this.userAddress;
    }
    
    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserQq() {
        return this.userQq;
    }
    
    public void setUserQq(String userQq) {
        this.userQq = userQq;
    }

    public String getUserPhone() {
        return this.userPhone;
    }
    
    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserMobile() {
        return this.userMobile;
    }
    
    public void setUserMobile(String userMobile) {
        this.userMobile = userMobile;
    }

    public Float getUserAccount() {
        return this.userAccount;
    }
    
    public void setUserAccount(Float userAccount) {
        this.userAccount = userAccount;
    }

    public String getUserIsyz() {
        return this.userIsyz;
    }
    
    public void setUserIsyz(String userIsyz) {
        this.userIsyz = userIsyz;
    }

    public Integer getUserScore() {
        return this.userScore;
    }
    
    public void setUserScore(Integer userScore) {
        this.userScore = userScore;
    }

    public String getUserFileName() {
        return this.userFileName;
    }
    
    public void setUserFileName(String userFileName) {
        this.userFileName = userFileName;
    }

    public String getUserIsvip() {
        return this.userIsvip;
    }
    
    public void setUserIsvip(String userIsvip) {
        this.userIsvip = userIsvip;
    }

    public Integer getUserSuccess() {
        return this.userSuccess;
    }
    
    public void setUserSuccess(Integer userSuccess) {
        this.userSuccess = userSuccess;
    }

    public Integer getUserFailure() {
        return this.userFailure;
    }
    
    public void setUserFailure(Integer userFailure) {
        this.userFailure = userFailure;
    }
   








}