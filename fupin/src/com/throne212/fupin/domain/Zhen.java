package com.throne212.fupin.domain;

public class Zhen extends Diqu {
	private ShiWorkOrg shiWorkOrg;// 扶持它的市扶贫办
	private AreaWorkOrg areaWorkOrg;// 扶持它的县扶贫办
	private Area area;// 所属区县
	


	public ShiWorkOrg getShiWorkOrg() {
		return shiWorkOrg;
	}

	public void setShiWorkOrg(ShiWorkOrg shiWorkOrg) {
		this.shiWorkOrg = shiWorkOrg;
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public AreaWorkOrg getAreaWorkOrg() {
		return areaWorkOrg;
	}

	public void setAreaWorkOrg(AreaWorkOrg areaWorkOrg) {
		this.areaWorkOrg = areaWorkOrg;
	}

}
