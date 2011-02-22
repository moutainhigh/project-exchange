package com.throne212.siliao.domain;

import java.io.Serializable;

//供应饲料厂
public class Provider extends FactoryAbs implements Serializable {

	private static final long serialVersionUID = 1L;

	private Factory factory;// 所属的饲料厂商
	private ProviderAccount account;// 负责人

	public Factory getFactory() {
		return factory;
	}

	public void setFactory(Factory factory) {
		this.factory = factory;
	}

	public ProviderAccount getAccount() {
		return account;
	}

	public void setAccount(ProviderAccount account) {
		this.account = account;
	}

}
