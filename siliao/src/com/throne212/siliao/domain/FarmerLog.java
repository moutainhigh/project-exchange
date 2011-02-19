package com.throne212.siliao.domain;

import java.io.Serializable;

//农户日志
public class FarmerLog extends Log implements Serializable {

	private static final long serialVersionUID = 1L;
	private Farmer farmer;// 操作的目标农户

	public Farmer getFarmer() {
		return farmer;
	}

	public void setFarmer(Farmer farmer) {
		this.farmer = farmer;
	}

}
