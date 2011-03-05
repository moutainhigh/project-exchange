package test.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * 
 * @author Dave zhf_0630@126.com 2009-03-26
 */
public class MailAuthenticator extends Authenticator {
	private final static String username = "yanglei123qwe";
	private final static String password = "1357913579";

	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(username, password);

	}
}
