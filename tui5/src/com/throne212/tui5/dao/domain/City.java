package com.throne212.tui5.dao.domain;

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
	private String cityId;//����,bj
	private String cityCode;//����,0100
	private String cityName;//����
	private String parentCode;//�ϼ�code
	private int grade;//����
	//����չʾ�����Ǵ洢��
	private String simpleName;
	private List<City> childs;
	// Constructors

	/** default constructor */
	public City() {
	}

	/** full constructor */
	public City(String cityCode, String cityName) {
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
		
		String[] arr = cityName.split(",");
		if (arr != null && arr.length == 2)
			this.simpleName = arr[1];
		else
			this.simpleName = cityName;	
		
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
	
  public void setSimpleName(String simpleName) {
		this.simpleName = simpleName;
	}

	public String getSimpleName() {
		
		return simpleName;
	}

	public void setChilds(List<City> childs) {
		this.childs = childs;
	}

	public List<City> getChilds() {
		return childs;
	}

}