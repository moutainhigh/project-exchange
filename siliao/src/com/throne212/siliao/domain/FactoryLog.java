package com.throne212.siliao.domain;

import java.io.Serializable;

//饲料厂商日志
public class FactoryLog extends Log implements Serializable {

	private static final long serialVersionUID = 1L;
	private Factory factory;// 操作的目标厂商
	private String name;
	private String type;
	private String remark;
	public Factory getFactory() {
		return factory;
	}

	public void setFactory(Factory factory) {
		this.factory = factory;
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

}
