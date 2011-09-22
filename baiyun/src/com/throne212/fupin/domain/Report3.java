package com.throne212.fupin.domain;

import java.util.List;

//报表3,对口帮扶低收入村项目建设及资金下拨明细表
public class Report3 extends Report{

	private Zhen zhen;//填写的镇
	
	private List<Report3Item> items;

	public Zhen getZhen() {
		return zhen;
	}

	public void setZhen(Zhen zhen) {
		this.zhen = zhen;
	}

	public List<Report3Item> getItems() {
		return items;
	}

	public void setItems(List<Report3Item> items) {
		this.items = items;
	}
	
}
