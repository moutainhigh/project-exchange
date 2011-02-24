package com.throne212.siliao.domain;

import java.io.Serializable;

import com.throne212.siliao.common.WebConstants;

//厂商的抽象类
public class FactoryAbs extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	protected String name;
	protected String remark;

	public FactoryAbs() {
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
	
	public String getFactoryType(){
		if(this instanceof Factory){
			return WebConstants.FACTORY_TYPE_FACTORY;
		}else{
			return WebConstants.FACTORY_TYPE_PROVIDER;
		}
	}
	
	public String getFactoryName(){
		if(this instanceof Provider){
			Provider a = (Provider) this;
			return a.getFactory().getName();
		}else{
			return "";
		}
	}
	public String getManagerName(){
		if(this instanceof Provider){
			Provider a = (Provider) this;
			return a.getAccount().getName();
		}else{
			return "";
		}
	}

}
