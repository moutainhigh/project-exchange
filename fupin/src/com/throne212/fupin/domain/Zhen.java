package com.throne212.fupin.domain;

import java.util.List;

public class Zhen extends Diqu {
	private ShiWorkOrg shiWorkOrg;// 扶持它的市扶贫办
	private AreaWorkOrg areaWorkOrg;// 扶持它的县扶贫办
	private Area area;// 所属区县
	private String isNS;//N为北部镇，S为南部镇
	
	private List<Cun> cunList;

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

	public List<Cun> getCunList() {
		return cunList;
	}

	public void setCunList(List<Cun> cunList) {
		this.cunList = cunList;
	}

	public String getIsNS() {
		return isNS;
	}

	public void setIsNS(String isNS) {
		this.isNS = isNS;
	}

}
