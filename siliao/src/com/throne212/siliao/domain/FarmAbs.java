package com.throne212.siliao.domain;

import java.io.Serializable;

import com.throne212.siliao.common.WebConstants;

//农场的抽象类
public class FarmAbs extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	protected String name;
	protected String remark;

	public FarmAbs() {
		super();
		// TODO Auto-generated constructor stub
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
	
	public String getFarmType(){
		if(this instanceof Area){
			return WebConstants.FARM_TYPE_AREA;
		}else{
			return WebConstants.FARM_TYPE_FARM;
		}
	}
	
	public String getFarmName(){
		if(this instanceof Area){
			Area a = (Area) this;
			return a.getFarm().getName();
		}else{
			return "";
		}
	}
	public String getManagerName(){
		if(this instanceof Area){
			Area a = (Area) this;
			return a.getAccount()==null?"":a.getAccount().getName();
		}else{
			Farm f = (Farm) this;
			return f.getManager()==null?"":f.getManager().getName();
		}
	}

}
