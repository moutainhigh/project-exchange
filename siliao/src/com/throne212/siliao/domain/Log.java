package com.throne212.siliao.domain;

import java.util.Date;

//日志父类
public abstract class Log extends MyEntity {
	protected String msg;//日志消息
	protected User byWho;//操作者
	protected Date logTime;//日志记录的准确时间

	//getter and setter
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public User getByWho() {
		return byWho;
	}

	public void setByWho(User byWho) {
		this.byWho = byWho;
	}

	public Date getLogTime() {
		return logTime;
	}

	public void setLogTime(Date logTime) {
		this.logTime = logTime;
	}

}
