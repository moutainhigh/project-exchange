package com.throne212.siliao.domain;

import java.io.Serializable;

//利率
public class Rate extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private Farm farm;// 目标农场
	private Provider provider;// 目标供应商
	private Double value;//月利率

	public Farm getFarm() {
		return farm;
	}

	public void setFarm(Farm farm) {
		this.farm = farm;
	}

	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}

}
