package com.throne212.siliao.domain;

import java.io.Serializable;

//供应商日志
public class ProviderLog extends Log implements Serializable {

	private static final long serialVersionUID = 1L;
	private Provider provider;// 操作的利率

	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}

}
