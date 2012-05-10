package com.throne212.jianzhi8.domain;

import java.sql.Timestamp;

/**
 * InfoZph entity. @author MyEclipse Persistence Tools
 */

public class InfoZph implements java.io.Serializable {

	// Fields

	private Integer zphNo;
	private String zphTitle;
	private String zphContent;
	private String zphProvince;
	private String zphUserName;
	private Timestamp zphRegdate;
	private Timestamp zphUpdate;
	private String zphIscheck;
	private String zphIpaddr;
	private String zphStartdate;
	private String zphEnddate;
	private Integer zphClick;
	private String zphUserId;
	
	public String getSimpleTitle(){
		if(zphTitle!=null && zphTitle.length() > 15){
			return zphTitle.substring(0, 15);
		}
		return zphTitle;
	}
	
	// Constructors

	/** default constructor */
	public InfoZph() {
	}

	/** minimal constructor */
	public InfoZph(String zphTitle, String zphContent, String zphProvince, Timestamp zphRegdate, Timestamp zphUpdate, String zphIscheck, String zphIpaddr, String zphStartdate, String zphEnddate) {
		this.zphTitle = zphTitle;
		this.zphContent = zphContent;
		this.zphProvince = zphProvince;
		this.zphRegdate = zphRegdate;
		this.zphUpdate = zphUpdate;
		this.zphIscheck = zphIscheck;
		this.zphIpaddr = zphIpaddr;
		this.zphStartdate = zphStartdate;
		this.zphEnddate = zphEnddate;
	}

	/** full constructor */
	public InfoZph(String zphTitle, String zphContent, String zphProvince, String zphUserName, Timestamp zphRegdate, Timestamp zphUpdate, String zphIscheck, String zphIpaddr, String zphStartdate,
			String zphEnddate, Integer zphClick, String zphUserId) {
		this.zphTitle = zphTitle;
		this.zphContent = zphContent;
		this.zphProvince = zphProvince;
		this.zphUserName = zphUserName;
		this.zphRegdate = zphRegdate;
		this.zphUpdate = zphUpdate;
		this.zphIscheck = zphIscheck;
		this.zphIpaddr = zphIpaddr;
		this.zphStartdate = zphStartdate;
		this.zphEnddate = zphEnddate;
		this.zphClick = zphClick;
		this.zphUserId = zphUserId;
	}

	// Property accessors

	public Integer getZphNo() {
		return this.zphNo;
	}

	public void setZphNo(Integer zphNo) {
		this.zphNo = zphNo;
	}

	public String getZphTitle() {
		return this.zphTitle;
	}

	public void setZphTitle(String zphTitle) {
		this.zphTitle = zphTitle;
	}

	public String getZphContent() {
		return this.zphContent;
	}

	public void setZphContent(String zphContent) {
		this.zphContent = zphContent;
	}

	public String getZphProvince() {
		return this.zphProvince;
	}

	public void setZphProvince(String zphProvince) {
		this.zphProvince = zphProvince;
	}

	public String getZphUserName() {
		return this.zphUserName;
	}

	public void setZphUserName(String zphUserName) {
		this.zphUserName = zphUserName;
	}

	public Timestamp getZphRegdate() {
		return this.zphRegdate;
	}

	public void setZphRegdate(Timestamp zphRegdate) {
		this.zphRegdate = zphRegdate;
	}

	public Timestamp getZphUpdate() {
		return this.zphUpdate;
	}

	public void setZphUpdate(Timestamp zphUpdate) {
		this.zphUpdate = zphUpdate;
	}

	public String getZphIscheck() {
		return this.zphIscheck;
	}

	public void setZphIscheck(String zphIscheck) {
		this.zphIscheck = zphIscheck;
	}

	public String getZphIpaddr() {
		return this.zphIpaddr;
	}

	public void setZphIpaddr(String zphIpaddr) {
		this.zphIpaddr = zphIpaddr;
	}

	public String getZphStartdate() {
		return this.zphStartdate;
	}

	public void setZphStartdate(String zphStartdate) {
		this.zphStartdate = zphStartdate;
	}

	public String getZphEnddate() {
		return this.zphEnddate;
	}

	public void setZphEnddate(String zphEnddate) {
		this.zphEnddate = zphEnddate;
	}

	public Integer getZphClick() {
		return this.zphClick;
	}

	public void setZphClick(Integer zphClick) {
		this.zphClick = zphClick;
	}

	public String getZphUserId() {
		return this.zphUserId;
	}

	public void setZphUserId(String zphUserId) {
		this.zphUserId = zphUserId;
	}

}