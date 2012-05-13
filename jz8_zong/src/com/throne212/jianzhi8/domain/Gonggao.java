package com.throne212.jianzhi8.domain;
// default package

import java.sql.Timestamp;


/**
 * Gonggao entity. @author MyEclipse Persistence Tools
 */

public class Gonggao  implements java.io.Serializable {


    // Fields    

     private Integer gaoNo;
     private String gaoContent;
     private Timestamp gaoDate;
     private String gaoIpaddr;
     private String gaoTitle;
     private String gaoIscheck;
     private String gaoUrl;
     private String gaoQq;
     private String gaoCompany;
     private String gaoPhone;
     private String gaoMoblie;
     private String gaoEmail;
     private Integer gaoClick;


    // Constructors

    /** default constructor */
    public Gonggao() {
    }

	/** minimal constructor */
    public Gonggao(String gaoContent, Timestamp gaoDate, String gaoIpaddr, String gaoTitle, String gaoIscheck) {
        this.gaoContent = gaoContent;
        this.gaoDate = gaoDate;
        this.gaoIpaddr = gaoIpaddr;
        this.gaoTitle = gaoTitle;
        this.gaoIscheck = gaoIscheck;
    }
    
    /** full constructor */
    public Gonggao(String gaoContent, Timestamp gaoDate, String gaoIpaddr, String gaoTitle, String gaoIscheck, String gaoUrl, String gaoQq, String gaoCompany, String gaoPhone, String gaoMoblie, String gaoEmail, Integer gaoClick) {
        this.gaoContent = gaoContent;
        this.gaoDate = gaoDate;
        this.gaoIpaddr = gaoIpaddr;
        this.gaoTitle = gaoTitle;
        this.gaoIscheck = gaoIscheck;
        this.gaoUrl = gaoUrl;
        this.gaoQq = gaoQq;
        this.gaoCompany = gaoCompany;
        this.gaoPhone = gaoPhone;
        this.gaoMoblie = gaoMoblie;
        this.gaoEmail = gaoEmail;
        this.gaoClick = gaoClick;
    }

   
    // Property accessors

    public Integer getGaoNo() {
        return this.gaoNo;
    }
    
    public void setGaoNo(Integer gaoNo) {
        this.gaoNo = gaoNo;
    }

    public String getGaoContent() {
        return this.gaoContent;
    }
    
    public void setGaoContent(String gaoContent) {
        this.gaoContent = gaoContent;
    }

    public Timestamp getGaoDate() {
        return this.gaoDate;
    }
    
    public void setGaoDate(Timestamp gaoDate) {
        this.gaoDate = gaoDate;
    }

    public String getGaoIpaddr() {
        return this.gaoIpaddr;
    }
    
    public void setGaoIpaddr(String gaoIpaddr) {
        this.gaoIpaddr = gaoIpaddr;
    }

    public String getGaoTitle() {
        return this.gaoTitle;
    }
    
    public void setGaoTitle(String gaoTitle) {
        this.gaoTitle = gaoTitle;
    }

    public String getGaoIscheck() {
        return this.gaoIscheck;
    }
    
    public void setGaoIscheck(String gaoIscheck) {
        this.gaoIscheck = gaoIscheck;
    }

    public String getGaoUrl() {
        return this.gaoUrl;
    }
    
    public void setGaoUrl(String gaoUrl) {
        this.gaoUrl = gaoUrl;
    }

    public String getGaoQq() {
        return this.gaoQq;
    }
    
    public void setGaoQq(String gaoQq) {
        this.gaoQq = gaoQq;
    }

    public String getGaoCompany() {
        return this.gaoCompany;
    }
    
    public void setGaoCompany(String gaoCompany) {
        this.gaoCompany = gaoCompany;
    }

    public String getGaoPhone() {
        return this.gaoPhone;
    }
    
    public void setGaoPhone(String gaoPhone) {
        this.gaoPhone = gaoPhone;
    }

    public String getGaoMoblie() {
        return this.gaoMoblie;
    }
    
    public void setGaoMoblie(String gaoMoblie) {
        this.gaoMoblie = gaoMoblie;
    }

    public String getGaoEmail() {
        return this.gaoEmail;
    }
    
    public void setGaoEmail(String gaoEmail) {
        this.gaoEmail = gaoEmail;
    }

    public Integer getGaoClick() {
        return this.gaoClick;
    }
    
    public void setGaoClick(Integer gaoClick) {
        this.gaoClick = gaoClick;
    }
   








}