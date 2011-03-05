package test.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * 邮件服务器认证
 * 
 * @author Dave zhf_0630@126.com 2009-03-26
 */
public class MailAuthenticator extends Authenticator {
	private final static String username = "xxx";
	private final static String password = "xxx";

	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(username, password);

	}
}
