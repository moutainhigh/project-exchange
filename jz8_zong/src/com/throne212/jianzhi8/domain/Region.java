package com.throne212.jianzhi8.domain;

// default package

/**
 * Region entity. @author MyEclipse Persistence Tools
 */

public class Region implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -6078871439989357526L;
	private String cityId;
	private String cityCode;
	private String cityName;
	
	private String simpleName;
	
	private String parentCode;
	private int grade;

	// Constructors

	/** default constructor */
	public Region() {
	}

	/** full constructor */
	public Region(String cityCode, String cityName) {
		this.cityCode = cityCode;
		this.cityName = cityName;
	}

	// Property accessors

	public String getCityId() {
		return this.cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public String getCityCode() {
		return this.cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	public String getCityName() {
		return this.cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getParentCode() {
		return parentCode;
	}

	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getSimpleName() {
		if(simpleName != null)
			return simpleName;
		if (cityName == null)
			return null;
		String[] arr = cityName.split(",");
		if (arr != null && arr.length == 2)
			simpleName = arr[1];
		else
			simpleName = cityName;
		return simpleName;
	}

}