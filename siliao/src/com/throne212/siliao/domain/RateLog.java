package com.throne212.siliao.domain;

import java.io.Serializable;
import java.util.Date;

//利率日志
public class RateLog extends Log implements Serializable {

	private static final long serialVersionUID = 1L;
	private Rate rate;// 操作的利率
	private String targetName;
	private Double value;
	private Date fromDate;//作用起始时间
	private Date endDate;//作用结束时间
	private String remark;

	public Rate getRate() {
		return rate;
	}

	public void setRate(Rate rate) {
		this.rate = rate;
	}

	public String getTargetName() {
		return targetName;
	}

	public void setTargetName(String targetName) {
		this.targetName = targetName;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
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
