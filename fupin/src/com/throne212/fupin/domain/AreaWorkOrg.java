package com.throne212.fupin.domain;

public class AreaWorkOrg extends User {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private Area area;//所在区
	
	private ShiWorkOrg shiWorkOrg;//所属市扶贫办
	
	private Zhen zhen;//对口的镇


	public Area getArea() {
		return area;
	}


	public void setArea(Area area) {
		this.area = area;
	}


	public ShiWorkOrg getShiWorkOrg() {
		return shiWorkOrg;
	}


	public void setShiWorkOrg(ShiWorkOrg shiWorkOrg) {
		this.shiWorkOrg = shiWorkOrg;
	}


	public Zhen getZhen() {
		return zhen;
	}


	public void setZhen(Zhen zhen) {
		this.zhen = zhen;
	}


	
}
