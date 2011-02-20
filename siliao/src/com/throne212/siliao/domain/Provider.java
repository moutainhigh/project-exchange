package com.throne212.siliao.domain;

import java.io.Serializable;

//供应饲料厂
public class Provider extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private String name;// 名称
	private Factory factory;// 所属的饲料厂商

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

}
