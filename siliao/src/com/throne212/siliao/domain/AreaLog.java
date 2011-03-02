package com.throne212.siliao.domain;

import java.io.Serializable;

//管区日志
public class AreaLog extends Log implements Serializable {

	private static final long serialVersionUID = 1L;
	private Area area;// 操作的目标管区
	private String name;
	private String type;
	private String remark;
	private String account;
	private String farmName;

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getFarmName() {
		return farmName;
	}

	public void setFarmName(String farmName) {
		this.farmName = farmName;
	}

}
