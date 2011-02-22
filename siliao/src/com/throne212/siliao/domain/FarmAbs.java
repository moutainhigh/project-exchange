package com.throne212.siliao.domain;

import java.io.Serializable;

//农场的抽象类
public class FarmAbs extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	protected String name;

	public FarmAbs() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
