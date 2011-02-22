package com.throne212.siliao.domain;

import java.io.Serializable;

//厂商的抽象类
public class FactoryAbs extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	protected String name;
	protected String remark;

	public FactoryAbs() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
