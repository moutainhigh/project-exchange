package com.throne212.siliao.domain;

import java.io.Serializable;

//管区
public class Area extends FarmAbs implements Serializable {

	private static final long serialVersionUID = 1L;

	private Farm farm;// 所属农场
	private AreaAccount account;//负责人

	public Farm getFarm() {
		return farm;
	}

	public void setFarm(Farm farm) {
		this.farm = farm;
	}

	public AreaAccount getAccount() {
		return account;
	}

	public void setAccount(AreaAccount account) {
		this.account = account;
	}

}
