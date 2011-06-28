package test;

import com.throne212.fupin.sms.SmsService;
import com.throne212.fupin.sms.SmsServicePortType;

public class SMSTest {
	public static void main(String[] args) {
		SmsServicePortType sme = new SmsService().getSmsServiceHttpPort();
		//sme.sendMessageToMobile("192.168.2.28","oa","mas","oa","oa123456",phoneStr,conntent,smsUserName,smsUserId);
	}
}
