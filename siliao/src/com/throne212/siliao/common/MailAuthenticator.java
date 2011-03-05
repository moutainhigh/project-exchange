package com.throne212.siliao.common;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * 
 * @author Dave zhf_0630@126.com 2009-03-26
 */
public class MailAuthenticator extends Authenticator {
	private String username = "";
	private String password = "";
	
	public MailAuthenticator(String username,String password){
		this.username = username;
		this.password = password;
	}

	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(username, password);

	}
}
