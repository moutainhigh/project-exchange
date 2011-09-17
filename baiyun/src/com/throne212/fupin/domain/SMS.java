package com.throne212.fupin.domain;

import java.util.Date;

//手机短信
public class SMS extends MyEntity {
	private String content;
	private String tel;
	private Date date;
	private Long smsUserId;
	private String smsUserName;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Long getSmsUserId() {
		return smsUserId;
	}

	public void setSmsUserId(Long smsUserId) {
		this.smsUserId = smsUserId;
	}

	public String getSmsUserName() {
		return smsUserName;
	}

	public void setSmsUserName(String smsUserName) {
		this.smsUserName = smsUserName;
	}

}
