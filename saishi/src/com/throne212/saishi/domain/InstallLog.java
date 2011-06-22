package com.throne212.saishi.domain;

import java.util.Date;

//安装和卸载日志
public class InstallLog extends MyEntity {
	private String type;// 安装或卸载
	private Date date;// 时间
	private String ip;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

}
