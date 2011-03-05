package com.throne212.siliao.common;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * 
 * @author Dave zhf_0630@126.com 2009-03-26
 */
public class MailAuthenticator extends Authenticator {
	private   String username ;
	private   String password ;

	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(username, password);

	}

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
	
	
}