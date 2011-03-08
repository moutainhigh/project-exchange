package com.throne212.siliao.common;

import java.math.BigDecimal;

public class ProviderStatDO {
	private Long orderNum;
	private String providerName;
	private Double totalAmount;
	private Double totalMoney;
	private Double totalAgentMoney;
	private Double totalRateMoney;
	private Double totalPay;
	private String farmName;
	private Object total;
	private String percentage;
	
	public String getPayPercentage() {
		if(totalPay == null || totalMoney==null || totalMoney==0)
			return "";
		Double percentage = (float) 100 * (Math.abs(totalPay) / totalMoney);
		int scale = 1;// 设置位数
		int roundingMode = 4;// 表示四舍五入
		BigDecimal bd = new BigDecimal((double) percentage);
		bd = bd.setScale(scale, roundingMode);
		percentage = bd.doubleValue();
		return percentage + "%";
	}
	
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
	public Double getTotalAgentMoney() {
		return totalAgentMoney;
	}
	public void setTotalAgentMoney(Double totalAgentMoney) {
		this.totalAgentMoney = totalAgentMoney;
	}
	public Double getTotalPay() {
		return totalPay;
	}
	public void setTotalPay(Double totalPay) {
		this.totalPay = totalPay;
	}

	public String getPercentage() {
		return percentage;
	}

	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}

}
