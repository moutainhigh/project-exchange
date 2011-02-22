package com.throne212.siliao.domain;

import java.io.Serializable;
import java.util.Date;

//利率
public class Rate extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private Farm farm;// 目标农场
	private Provider provider;// 目标供应商
	private Double value;//月利率
	private String rateType;//主体类型
	private Date fromDate;//作用起始时间
	private Date endDate;//作用结束时间
	private String remark;//备注

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

	public String getRateType() {
		return rateType;
	}

	public void setRateType(String rateType) {
		this.rateType = rateType;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
