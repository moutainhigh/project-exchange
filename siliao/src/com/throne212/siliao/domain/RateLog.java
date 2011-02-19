package com.throne212.siliao.domain;

import java.io.Serializable;

//利率日志
public class RateLog extends Log implements Serializable {

	private static final long serialVersionUID = 1L;
	private Rate rate;// 操作的利率

	public Rate getRate() {
		return rate;
	}

	public void setRate(Rate rate) {
		this.rate = rate;
	}

}
