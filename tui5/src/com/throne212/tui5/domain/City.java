package com.throne212.tui5.domain;

// default package
import java.util.List;
/**
 * User entity. @author Yang Lei
 */
public class City implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -6078871439989357526L;
	private String cityId;//主键,0100
	private String cityPinyin;//编码,bj
	private String cityName;//北京
	private String parentId;//上级id,0100
	private int grade;//级别
	//用于展示而不是存储的
	private String simpleName;
	private List<City> childs;
	// Constructors

	/** default constructor */
	public City() {
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public String getCityPinyin() {
		return cityPinyin;
	}

	public void setCityPinyin(String cityPinyin) {
		this.cityPinyin = cityPinyin;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getSimpleName() {
		return simpleName;
	}

	public void setSimpleName(String simpleName) {
		this.simpleName = simpleName;
	}

	public List<City> getChilds() {
		return childs;
	}

	public void setChilds(List<City> childs) {
		this.childs = childs;
	}
}