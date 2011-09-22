package com.throne212.fupin.domain;

//报表3的item，对应一个村项目
public class Report3Item extends MyEntity{

	private Report3 r;

	private ProjectCun proCun;
	
	private String reachMoney;
	
	private String reachDate;
	
	private String payMoney;
	
	private String payDate;
	
	private String comment;

	public Report3 getR() {
		return r;
	}

	public void setR(Report3 r) {
		this.r = r;
	}

	public ProjectCun getProCun() {
		return proCun;
	}

	public void setProCun(ProjectCun proCun) {
		this.proCun = proCun;
	}

	public String getReachMoney() {
		return reachMoney;
	}

	public void setReachMoney(String reachMoney) {
		this.reachMoney = reachMoney;
	}

	public String getReachDate() {
		return reachDate;
	}

	public void setReachDate(String reachDate) {
		this.reachDate = reachDate;
	}

	public String getPayMoney() {
		return payMoney;
	}

	public void setPayMoney(String payMoney) {
		this.payMoney = payMoney;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
}
