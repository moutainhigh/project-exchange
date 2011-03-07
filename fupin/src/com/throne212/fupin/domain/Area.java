package com.throne212.fupin.domain;

public class Area extends MyEntity {
	private String areaName;//区县名
	private Shi shi;//所属市
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public Shi getShi() {
		return shi;
	}
	public void setShi(Shi shi) {
		this.shi = shi;
	}

}
