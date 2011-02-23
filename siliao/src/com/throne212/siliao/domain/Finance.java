package com.throne212.siliao.domain;

import java.io.Serializable;

//财务表
public class Finance extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	protected Bill order;// 属于哪个订单的

	public Bill getOrder() {
		return order;
	}

	public void setOrder(Bill order) {
		this.order = order;
	}

}
