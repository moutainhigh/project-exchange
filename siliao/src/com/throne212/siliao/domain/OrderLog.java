package com.throne212.siliao.domain;

import java.io.Serializable;

//单据操作日志
public class OrderLog extends Log implements Serializable {

	private static final long serialVersionUID = 1L;
	private Order order;// 单据
	private User user;// 操作人

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
