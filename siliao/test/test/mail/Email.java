package test.mail;

import java.util.Date;

/**
 * 邮件类
 * 
 * @author Dave zhf_0630@126.com 2009-03-26
 */
public class Email {
	public final static String TO = "yanglei123qwe@163.com";
	public final static String FROM = "yanglei123qwe@163.com";
	public final static String CC = null;
	public final static String BCC = null;
	public final static String Email_Subject = "Test Email With JavaMail";
	public final static String Email_Header = "This Is Email Header";
	public final static String Email_Body = "This Is Email Body";
	public final static String Email_Host = "smtp.163.com";
	public Date sendDate = null;

	public Email() {
	}
}
