package com.throne212.siliao.common;

import java.math.BigDecimal;

public class FarmerStatDO {
	private Long orderNum;
	private String areaName;
	private String areaAccount;
	private Double totalAmount;
	private Double totalMoney;
	private Double totalOwn;
	private Double totalPay;
	private Object total;
	private String percentage;;

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

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getAreaAccount() {
		return areaAccount;
	}

	public void setAreaAccount(String areaAccount) {
		this.areaAccount = areaAccount;
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

	public Double getTotalOwn() {
		return totalOwn;
	}

	public void setTotalOwn(Double totalOwn) {
		this.totalOwn = totalOwn;
	}

	public Double getTotalPay() {
		return totalPay;
	}

	public void setTotalPay(Double totalPay) {
		this.totalPay = totalPay;
	}

	public Object getTotal() {
		return total;
	}

	public void setTotal(Object total) {
		this.total = total;
	}

	public String getPercentage() {
		return percentage;
	}

	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}

}
