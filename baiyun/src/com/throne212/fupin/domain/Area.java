package com.throne212.fupin.domain;

import java.util.List;

public class Area extends Diqu {
	private Shi shi;// 所属市
	
	private List<Zhen> zhenList;

	public Shi getShi() {
		return shi;
	}

	public void setShi(Shi shi) {
		this.shi = shi;
	}

	public List<Zhen> getZhenList() {
		return zhenList;
	}

	public void setZhenList(List<Zhen> zhenList) {
		this.zhenList = zhenList;
	}

}
