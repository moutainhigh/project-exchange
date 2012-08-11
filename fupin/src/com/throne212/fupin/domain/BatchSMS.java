package com.throne212.fupin.domain;

import java.util.Date;

//手机批量短信
public class BatchSMS extends MyEntity {
	
	private String content;
	private Date date;
	private String receiver;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

}
