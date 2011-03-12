package com.throne212.fupin.domain;

public class Diqu extends MyEntity {
	
	protected String name;
	protected String remark;
	
	public String getType(){
		if(this instanceof Shi)
			return "市";
		else if(this instanceof Area)
			return "区县";
		else if(this instanceof Zhen)
			return "镇";
		else if(this instanceof Cun)
			return "村";
		return "";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
