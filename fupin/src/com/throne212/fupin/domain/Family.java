package com.throne212.fupin.domain;

public class Family extends MyEntity {
	
	private String familyName;
	private Cun cun;

	public Cun getCun() {
		return cun;
	}

	public void setCun(Cun cun) {
		this.cun = cun;
	}

	public String getFamilyName() {
		return familyName;
	}

	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}

}
