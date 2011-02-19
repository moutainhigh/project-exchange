package com.throne212.siliao.domain;

import java.io.Serializable;

//管区负责人
public class AreaAccount extends User implements Serializable {

	private static final long serialVersionUID = 1L;

	private Area area;// 所属的管区

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

}
