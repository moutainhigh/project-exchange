package com.throne212.siliao.domain;

import java.io.Serializable;

//财务表
public class Finance extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	protected Order order;// 属于哪个订单的

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

}
