package com.throne212.tui5.domain;

import java.math.BigDecimal;
import java.util.Date;

//充值或提现记录
public class MoneyRecord {

	private Long id;
	private String content;// 内容，原因
	private String comment;// 注释
	private Date applyTime;// 申请时间
	private Date completeTime;// 完成时间
	private Integer type;// 1充值，0提现
	private User user;// 用户
	private BigDecimal money;// 金额
	private Integer status;//1申请中，2完成，3失败

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	public Date getCompleteTime() {
		return completeTime;
	}

	public void setCompleteTime(Date completeTime) {
		this.completeTime = completeTime;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public BigDecimal getMoney() {
		return money;
	}

	public void setMoney(BigDecimal money) {
		this.money = money;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	public String getStatusTxt(){
		if(status == null)
			return "";
		switch (status) {
		case 1:
			return "已申请";
		case 2:
			return "已成功";
		case 3:
			return "失败";
		default:
			return "";
		}
	}

}
