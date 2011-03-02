package com.throne212.siliao.domain;

import java.io.Serializable;

//供应商日志
public class ProviderLog extends Log implements Serializable {

	private static final long serialVersionUID = 1L;
	private Provider provider;// 操作的利率
	private String name;
	private String type;
	private String remark;
	private String factoryName;
	private String account;
	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getFactoryName() {
		return factoryName;
	}

	public void setFactoryName(String factoryName) {
		this.factoryName = factoryName;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

}
