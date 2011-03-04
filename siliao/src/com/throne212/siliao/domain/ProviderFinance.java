package com.throne212.siliao.domain;

import java.io.Serializable;
import java.util.Date;

//供应饲料厂财务表
public class ProviderFinance extends Finance implements Serializable {

	private static final long serialVersionUID = 1L;

	private Farmer farmer;
	private Provider provider;
	private Factory factory;
	private Double amount;// 累计吨数
	private Double money;// 合计金额
	private Date rateFromDate;// 起息日
	private Double rateMoney;// 累计利息
	private Double totalMoney;// 本息
	private Farm farm;// 属于农场
	private Double agentMoney;//代理收入

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

	public Farm getFarm() {
		return farm;
	}

	public void setFarm(Farm farm) {
		this.farm = farm;
	}

	public Factory getFactory() {
		return factory;
	}

	public void setFactory(Factory factory) {
		this.factory = factory;
	}

	public Double getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}

	public Double getAgentMoney() {
		return agentMoney;
	}

	public void setAgentMoney(Double agentMoney) {
		this.agentMoney = agentMoney;
	}

}
