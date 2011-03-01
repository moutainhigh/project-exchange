package com.throne212.siliao.common;

public class ProviderStatDO {
	private Long orderNum;
	private String providerName;
	private Double totalAmount;
	private Double totalMoney;
	private Double totalRateMoney;
	private String farmName;
	private Object total;
	public Long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}
	public String getProviderName() {
		return providerName;
	}
	public void setProviderName(String providerName) {
		this.providerName = providerName;
	}
	public Double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}
	public Double getTotalRateMoney() {
		return totalRateMoney;
	}
	public void setTotalRateMoney(Double totalRateMoney) {
		this.totalRateMoney = totalRateMoney;
	}
	public String getFarmName() {
		return farmName;
	}
	public void setFarmName(String farmName) {
		this.farmName = farmName;
	}
	public Object getTotal() {
		return total;
	}
	public void setTotal(Object total) {
		this.total = total;
	}

}
