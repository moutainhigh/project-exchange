package com.throne212.siliao.domain;

import java.io.Serializable;

public class BillOrderNum implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long num;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getNum() {
		return num;
	}

	public void setNum(Long num) {
		this.num = num;
	}

}
