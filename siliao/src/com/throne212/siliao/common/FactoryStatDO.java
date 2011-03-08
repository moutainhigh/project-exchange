package com.throne212.siliao.common;

import java.math.BigDecimal;

public class FactoryStatDO {
	private Long orderNum;
	private String factoryName;
	private Double totalAmount;
	private Double totalMoney;
	private Object total;
	// for集团统计的字段
	private Double totalPay;// 已付款
	private Double ownBalance;// 欠款余额
	private String percentage;

	public String getPayPercentage() {
		if (totalPay == null || totalMoney == null || totalMoney == 0)
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

	public String getFactoryName() {
		return factoryName;
	}

	public void setFactoryName(String factoryName) {
		this.factoryName = factoryName;
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

	public Object getTotal() {
		return total;
	}

	public void setTotal(Object total) {
		this.total = total;
	}

	public Double getTotalPay() {
		return totalPay;
	}

	public void setTotalPay(Double totalPay) {
		this.totalPay = totalPay;
	}

	public Double getOwnBalance() {
		return ownBalance;
	}

	public void setOwnBalance(Double ownBalance) {
		this.ownBalance = ownBalance;
	}

	public String getPercentage() {
		return percentage;
	}

	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}

}
