package com.throne212.siliao.domain;

import java.io.Serializable;

//管区日志
public class AreaLog extends Log implements Serializable {

	private static final long serialVersionUID = 1L;
	private Area area;// 操作的目标管区

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

}
