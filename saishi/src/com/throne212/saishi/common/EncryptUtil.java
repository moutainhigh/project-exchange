package com.throne212.saishi.common;

import java.security.MessageDigest;

import org.apache.log4j.Logger;

public class EncryptUtil {
	private static Logger logger = Logger.getLogger(EncryptUtil.class);

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
	
	public static String md5Encode(String sourceString) {
		String resultString = null;
		
		try {
			resultString = new String(sourceString);
			MessageDigest md = MessageDigest.getInstance("MD5");
			resultString = byte2hexString(md.digest(resultString.getBytes()));
		} catch (Exception e) {
			logger.error("Error while doing MD5 encryption", e);
		}
		
		return resultString;
	}
}
