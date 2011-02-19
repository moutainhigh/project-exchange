package com.throne212.siliao.domain;

import java.io.Serializable;

//农场日志
public class FarmLog extends Log implements Serializable {

	private static final long serialVersionUID = 1L;
	private Farm farm;// 操作的目标农场

	public Farm getFarm() {
		return farm;
	}

	public void setFarm(Farm farm) {
		this.farm = farm;
	}

}
