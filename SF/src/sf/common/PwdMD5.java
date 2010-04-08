package sf.common;

import java.security.MessageDigest;

import org.apache.log4j.Logger;


public class PwdMD5 {
	private static Logger log = Logger.getLogger(PwdMD5.class.getName());

	public static String encode(String sourceString) {
		String resultString = null;
		try {
			resultString = new String(sourceString);
			MessageDigest md = MessageDigest.getInstance("MD5");
			resultString = byte2hexString(md.digest(resultString.getBytes()));
		} catch (Exception ex) {
			log.error("Error in Encry PWD:encode(String sourceString)" , ex);
		}
		return resultString;
	}

	private static String byte2hexString(byte[] bytes) {
		StringBuffer buf = new StringBuffer(bytes.length * 2);
		for (int i = 0; i < bytes.length; i++) {
			if (((int) bytes[i] & 0xff) < 0x10) {
				buf.append("0");
			}
			buf.append(Long.toString((int) bytes[i] & 0xff, 16));
		}
		return buf.toString();
	}

	public static String getPwd(String user, String pwd) {
		String result = "";
		if (pwd.length() < 32) {
			result = encode(user + pwd);
			result = encode(result.substring(6) + result.substring(0, 6));
			return result;
		} else
			result = pwd;

		return result;
	}

}
