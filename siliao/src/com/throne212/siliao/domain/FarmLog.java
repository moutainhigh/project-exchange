package com.throne212.siliao.domain;

import java.io.Serializable;

//农场日志
public class FarmLog extends Log implements Serializable {

	private static final long serialVersionUID = 1L;
	private Farm farm;// 操作的目标农场
	private String name;
	private String type;
	private String remark;
	private String manager;
	public Farm getFarm() {
		return farm;
	}

	public void setFarm(Farm farm) {
		this.farm = farm;
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

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

}
