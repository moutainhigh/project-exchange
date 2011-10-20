package com.throne212.fupin.domain;

//项目完成状态
public class ProjectStat extends MyEntity {

	private Integer year;
	private Integer month;
	private String half;//1:shang,2:xia
	
	private String complete;// 完成情况
	private String problem;// 存在问题及拟解决措施
	private String money;// 资金到位
	
	//锁定
	private Integer lock;//0代表未锁/已解锁，1代表锁定，2代表请求解锁, 3代表暂存
	
	private String cunRemark;
	
	public String getComplete() {
		return complete;
	}

	public void setComplete(String complete) {
		this.complete = complete;
	}

	public String getProblem() {
		return problem;
	}

	public void setProblem(String problem) {
		this.problem = problem;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public String getHalf() {
		return half;
	}

	public void setHalf(String half) {
		this.half = half;
	}

	public String getCunRemark() {
		return cunRemark;
	}

	public void setCunRemark(String cunRemark) {
		this.cunRemark = cunRemark;
	}

	public Integer getLock() {
		return lock;
	}

	public void setLock(Integer lock) {
		this.lock = lock;
	}

}
