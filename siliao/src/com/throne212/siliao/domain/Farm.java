package com.throne212.siliao.domain;

import java.io.Serializable;

//农场
public class Farm extends FarmAbs implements Serializable {

	private static final long serialVersionUID = 1L;

	private ManagerAccount manager;// 饲料经理

	public ManagerAccount getManager() {
		return manager;
	}

	public void setManager(ManagerAccount manager) {
		this.manager = manager;
	}

}
