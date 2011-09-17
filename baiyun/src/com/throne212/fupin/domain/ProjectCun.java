package com.throne212.fupin.domain;

//村项目
public class ProjectCun extends Project {

	private String content;// 建设规模及内容
	private String deadline;// 完成时限;
	private String money;// 帮扶资金（万元）
	private String leader;// 挂村区领导
	private String contactName;// 联络员
	private String contactTel;// 联络员电话

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getLeader() {
		return leader;
	}

	public void setLeader(String leader) {
		this.leader = leader;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactTel() {
		return contactTel;
	}

	public void setContactTel(String contactTel) {
		this.contactTel = contactTel;
	}

}
