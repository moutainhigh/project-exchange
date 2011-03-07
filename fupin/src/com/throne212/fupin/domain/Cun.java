package com.throne212.fupin.domain;

public class Cun extends MyEntity {
	private String cunName;
	private Zhen zhen;
	private Org org;
	
	public String getCunName() {
		return cunName;
	}
	public void setCunName(String cunName) {
		this.cunName = cunName;
	}
	public Zhen getZhen() {
		return zhen;
	}
	public void setZhen(Zhen zhen) {
		this.zhen = zhen;
	}
	public Org getOrg() {
		return org;
	}
	public void setOrg(Org org) {
		this.org = org;
	}
	
}
