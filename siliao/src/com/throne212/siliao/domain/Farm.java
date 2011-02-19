package com.throne212.siliao.domain;

import java.io.Serializable;

//农场
public class Farm extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private String name;// 农场名称

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
