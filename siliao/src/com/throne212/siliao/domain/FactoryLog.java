package com.throne212.siliao.domain;

import java.io.Serializable;

//饲料厂商日志
public class FactoryLog extends Log implements Serializable {

	private static final long serialVersionUID = 1L;
	private Factory factory;// 操作的目标厂商

	public Factory getFactory() {
		return factory;
	}

	public void setFactory(Factory factory) {
		this.factory = factory;
	}

}
