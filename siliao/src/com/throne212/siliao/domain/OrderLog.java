package com.throne212.siliao.domain;

import java.io.Serializable;

//单据操作日志
public class OrderLog extends Log implements Serializable {

	private static final long serialVersionUID = 1L;
	private Order order;// 单据
	private User user;// 操作人
	private Integer fromStatus;// 起初状态
	private Integer toStatus;// 最终状态
	private String remark;//操作意见

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

	public Integer getFromStatus() {
		return fromStatus;
	}

	public void setFromStatus(Integer fromStatus) {
		this.fromStatus = fromStatus;
	}

	public Integer getToStatus() {
		return toStatus;
	}

	public void setToStatus(Integer toStatus) {
		this.toStatus = toStatus;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
