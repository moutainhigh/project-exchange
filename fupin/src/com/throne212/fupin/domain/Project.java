package com.throne212.fupin.domain;

//项目管理的父类
public class Project extends MyEntity {

	private Org org;
	private Cun cun;
	private String name;// 项目名称

	public Org getOrg() {
		return org;
	}

	public void setOrg(Org org) {
		this.org = org;
	}

	public Cun getCun() {
		return cun;
	}

	public void setCun(Cun cun) {
		this.cun = cun;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
