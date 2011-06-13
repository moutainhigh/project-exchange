package com.throne212.fupin.domain;

public class AreaWorkOrg extends User {

	private static final long serialVersionUID = 1L;

	private Area area;// 所在区

	private ShiWorkOrg shiWorkOrg;// 所属市扶贫办
	
	private String loginName2;
	private String password2;
	private String isWorkGroup;
	private String isDiv;//独立管理的区县，比如白云区

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public ShiWorkOrg getShiWorkOrg() {
		return shiWorkOrg;
	}

	public void setShiWorkOrg(ShiWorkOrg shiWorkOrg) {
		this.shiWorkOrg = shiWorkOrg;
	}

	public String getLoginName2() {
		return loginName2;
	}

	public void setLoginName2(String loginName2) {
		this.loginName2 = loginName2;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getIsWorkGroup() {
		return isWorkGroup;
	}

	public void setIsWorkGroup(String isWorkGroup) {
		this.isWorkGroup = isWorkGroup;
	}

	public String getIsDiv() {
		return isDiv;
	}

	public void setIsDiv(String isDiv) {
		this.isDiv = isDiv;
	}

}
