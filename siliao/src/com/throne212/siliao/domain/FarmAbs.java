package com.throne212.siliao.domain;

import java.io.Serializable;

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
