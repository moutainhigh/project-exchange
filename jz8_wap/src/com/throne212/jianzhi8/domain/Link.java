package com.throne212.jianzhi8.domain;
// default package

import java.sql.Timestamp;


/**
 * Link entity. @author MyEclipse Persistence Tools
 */

public class Link  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 3936942276473603899L;
	private Integer linkNo;
     private String linkName;
     private String linkHttp;
     private String linkFlag;
     private Integer linkOrderNum;
     private Timestamp linkDate;
     private String linkCityid;
     private String linkContact;
     private String linkGgsite;
     private String linkBaidusite;
     private String linkKuaizhao;
     private String linkMybaidu;
     private String linkMygg;
     private String linkByuser;
     private String linkUrl;
     private String linkPr;


    // Constructors

    /** default constructor */
    public Link() {
    }

	/** minimal constructor */
    public Link(String linkName, String linkHttp, String linkFlag, Integer linkOrderNum, Timestamp linkDate, String linkCityid) {
        this.linkName = linkName;
        this.linkHttp = linkHttp;
        this.linkFlag = linkFlag;
        this.linkOrderNum = linkOrderNum;
        this.linkDate = linkDate;
        this.linkCityid = linkCityid;
    }
    
    /** full constructor */
    public Link(String linkName, String linkHttp, String linkFlag, Integer linkOrderNum, Timestamp linkDate, String linkCityid, String linkContact, String linkGgsite, String linkBaidusite, String linkKuaizhao, String linkMybaidu, String linkMygg, String linkByuser, String linkUrl, String linkPr) {
        this.linkName = linkName;
        this.linkHttp = linkHttp;
        this.linkFlag = linkFlag;
        this.linkOrderNum = linkOrderNum;
        this.linkDate = linkDate;
        this.linkCityid = linkCityid;
        this.linkContact = linkContact;
        this.linkGgsite = linkGgsite;
        this.linkBaidusite = linkBaidusite;
        this.linkKuaizhao = linkKuaizhao;
        this.linkMybaidu = linkMybaidu;
        this.linkMygg = linkMygg;
        this.linkByuser = linkByuser;
        this.linkUrl = linkUrl;
        this.linkPr = linkPr;
    }

   
    // Property accessors

    public Integer getLinkNo() {
        return this.linkNo;
    }
    
    public void setLinkNo(Integer linkNo) {
        this.linkNo = linkNo;
    }

    public String getLinkName() {
        return this.linkName;
    }
    
    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    public String getLinkHttp() {
        return this.linkHttp;
    }
    
    public void setLinkHttp(String linkHttp) {
        this.linkHttp = linkHttp;
    }

    public String getLinkFlag() {
        return this.linkFlag;
    }
    
    public void setLinkFlag(String linkFlag) {
        this.linkFlag = linkFlag;
    }

    public Integer getLinkOrderNum() {
        return this.linkOrderNum;
    }
    
    public void setLinkOrderNum(Integer linkOrderNum) {
        this.linkOrderNum = linkOrderNum;
    }

    public Timestamp getLinkDate() {
        return this.linkDate;
    }
    
    public void setLinkDate(Timestamp linkDate) {
        this.linkDate = linkDate;
    }

    public String getLinkCityid() {
        return this.linkCityid;
    }
    
    public void setLinkCityid(String linkCityid) {
        this.linkCityid = linkCityid;
    }

    public String getLinkContact() {
        return this.linkContact;
    }
    
    public void setLinkContact(String linkContact) {
        this.linkContact = linkContact;
    }

    public String getLinkGgsite() {
        return this.linkGgsite;
    }
    
    public void setLinkGgsite(String linkGgsite) {
        this.linkGgsite = linkGgsite;
    }

    public String getLinkBaidusite() {
        return this.linkBaidusite;
    }
    
    public void setLinkBaidusite(String linkBaidusite) {
        this.linkBaidusite = linkBaidusite;
    }

    public String getLinkKuaizhao() {
        return this.linkKuaizhao;
    }
    
    public void setLinkKuaizhao(String linkKuaizhao) {
        this.linkKuaizhao = linkKuaizhao;
    }

    public String getLinkMybaidu() {
        return this.linkMybaidu;
    }
    
    public void setLinkMybaidu(String linkMybaidu) {
        this.linkMybaidu = linkMybaidu;
    }

    public String getLinkMygg() {
        return this.linkMygg;
    }
    
    public void setLinkMygg(String linkMygg) {
        this.linkMygg = linkMygg;
    }

    public String getLinkByuser() {
        return this.linkByuser;
    }
    
    public void setLinkByuser(String linkByuser) {
        this.linkByuser = linkByuser;
    }

    public String getLinkUrl() {
        return this.linkUrl;
    }
    
    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public String getLinkPr() {
        return this.linkPr;
    }
    
    public void setLinkPr(String linkPr) {
        this.linkPr = linkPr;
    }
   








}