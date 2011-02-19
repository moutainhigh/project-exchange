package com.throne212.siliao.domain;

import java.io.Serializable;

//饲料经理
public class ManagerAccount extends User implements Serializable {

	private static final long serialVersionUID = 1L;

	private Farm farm;// 所属的农场

	public Farm getFarm() {
		return farm;
	}

	public void setFarm(Farm farm) {
		this.farm = farm;
	}


}
