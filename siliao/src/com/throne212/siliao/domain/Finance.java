package com.throne212.siliao.domain;

import java.io.Serializable;

//财务表
public class Finance extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	protected Bill bill;// 属于哪个订单的

	public Bill getBill() {
		return bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}

}
