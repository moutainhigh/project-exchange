package com.throne212.fupin.domain;

public class ZhenWorkOrg extends User {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private Zhen zhen;
	private AreaWorkOrg areaWorkOrg;


	public Zhen getZhen() {
		return zhen;
	}


	public void setZhen(Zhen zhen) {
		this.zhen = zhen;
	}


	public AreaWorkOrg getAreaWorkOrg() {
		return areaWorkOrg;
	}


	public void setAreaWorkOrg(AreaWorkOrg areaWorkOrg) {
		this.areaWorkOrg = areaWorkOrg;
	}
	
}
