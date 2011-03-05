package test;

import com.throne212.siliao.common.SendMail;


public class MailTest {
	private static String smtpServer = "smtp.qq.com";
	public static void main(String[] args) {
		SendMail m = new SendMail(smtpServer);
		m.setNeedAuth(true);
		m.setNamePass("41666693", "yl11311088");
		m.setFrom("41666693qwe@qq.com");
		m.setSubject("test");
		m.setTo("yanglei123qwe@163.com");
		m.setBody("text...");
		m.sendout();
		
	}
}
