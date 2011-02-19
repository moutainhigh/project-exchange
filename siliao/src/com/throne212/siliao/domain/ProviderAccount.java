package com.throne212.siliao.domain;

import java.io.Serializable;

//饲料供应商
public class ProviderAccount extends User implements Serializable {

	private static final long serialVersionUID = 1L;

	private Provider provider;// 所属的供应商

	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}

}
