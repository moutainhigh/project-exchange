package com.throne212.siliao.domain;

import java.io.Serializable;

public class MailSetting extends MyEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private String username;//登录名
	private String password;//密码
	private String smtp;//smtp服务器地址
	private String from;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSmtp() {
		return smtp;
	}

	public void setSmtp(String smtp) {
		this.smtp = smtp;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

}
