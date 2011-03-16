package com.throne212.fupin.domain;

import java.io.Serializable;

//重审记录
public class Recheck extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String reason;
	private String module;
	private String state;
	private Long recordId;
	private Org org;

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Long getRecordId() {
		return recordId;
	}

	public void setRecordId(Long recordId) {
		this.recordId = recordId;
	}

	public Org getOrg() {
		return org;
	}

	public void setOrg(Org org) {
		this.org = org;
	}

}
