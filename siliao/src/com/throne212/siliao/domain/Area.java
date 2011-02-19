package com.throne212.siliao.domain;

import java.io.Serializable;

//管区
public class Area extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private String name;// 管区名称
	private Farm farm;// 所属农场

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Farm getFarm() {
		return farm;
	}

	public void setFarm(Farm farm) {
		this.farm = farm;
	}

}
