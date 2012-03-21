package com.throne212.fupin.domain;


public class Question2 extends Question {
	
	private Family family;
	
	private String idNo;//填写的身份证号码
	
	private Org org;

	public Org getOrg() {
		return org;
	}

	public void setOrg(Org org) {
		this.org = org;
	}

	public Family getFamily() {
		return family;
	}

	public void setFamily(Family family) {
		this.family = family;
	}

	public String getIdNo() {
		return idNo;
	}

	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}
	
}
