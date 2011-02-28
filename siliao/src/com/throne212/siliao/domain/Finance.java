package com.throne212.siliao.domain;

import java.io.Serializable;
import java.util.Date;

import com.throne212.siliao.common.WebConstants;

//财务表
public class Finance extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	protected Bill bill;// 属于哪个订单的
	protected Integer type;//支出或收入
	protected Date payDate;//支付日期
	protected String remark;//付款或收款备注

	public Bill getBill() {
		return bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getTypeTxt(){
		if(type == null)
			return "";
		if(type == WebConstants.FINANCE_STATUS_GET){
			return "收款";
		}else if(type == WebConstants.FINANCE_STATUS_PAY){
			return "支付";
		}else if(type == 0){
			return "单据财务";
		}
		return "";
	}

}
