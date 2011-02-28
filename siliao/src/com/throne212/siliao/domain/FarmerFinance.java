package com.throne212.siliao.domain;

import java.io.Serializable;
import java.util.Date;

//农户财务表
public class FarmerFinance extends Finance implements Serializable {

	private static final long serialVersionUID = 1L;

	private Farmer farmer;
	private Provider provider;
	private Factory factory;
	private String size;// 型号
	private String model;// 规格
	private Double amount;// 吨数
	private Double money;// 合计金额
	private Date rateFromDate;// 起息日
	private Double rateMoney;// 单笔利息
	private Area area;// 属于区域
	private Double totalMoney;// 本息

	public Farmer getFarmer() {
		return farmer;
	}

	public void setFarmer(Farmer farmer) {
		this.farmer = farmer;
	}

	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}

	public Factory getFactory() {
		return factory;
	}

	public void setFactory(Factory factory) {
		this.factory = factory;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public Double getMoney() {
		return money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}

	public Date getRateFromDate() {
		return rateFromDate;
	}

	public void setRateFromDate(Date rateFromDate) {
		this.rateFromDate = rateFromDate;
	}

	public Double getRateMoney() {
		return rateMoney;
	}

	public void setRateMoney(Double rateMoney) {
		this.rateMoney = rateMoney;
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public Double getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}

}
