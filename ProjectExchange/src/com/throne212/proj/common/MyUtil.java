package com.throne212.proj.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;

public class MyUtil {
	private static Logger logger = Logger.getLogger(MyUtil.class);

	public static String getCurrentDate() {
		return getDate(new Date());
	}

	public static String getDate(Date date) {
		if (date == null)
			return null;
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		return dateFormat.format(date);
	}

	public static Date getDateByTxt(String dateTxt) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		return dateFormat.parse(dateTxt);
	}

	public static String getCurrentDateTime() {
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:SS");
		return dateFormat.format(date);
	}

	public static boolean isEmpty(String str) {
		if (str == null || "".equals(str.trim()))
			return true;
		return false;
	}

	public static boolean isValideParameter(String[] param) {
		return param != null && param.length > 0 && !"".equals(param[0]);
	}

	public static String getExtention(String source) {
		int pos = source.indexOf(".");
		return source.substring(pos);
	}

	public static void copyFile(File src, File dst) {
		final int BUFFER_SIZE = 16 * 1024;
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst), BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while (in.read(buffer) > 0) {
					out.write(buffer);
				}
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	public static Date getNextDate(Date d) {
		return getAfterDaysDate(d, 1);
	}

	public static Date getAfterDaysDate(Date d, int days) {
		long addTime = 1;
		addTime *= days;
		addTime *= 24;
		addTime *= 60;
		addTime *= 60;
		addTime *= 1000;
		return new Date(d.getTime() + addTime);
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

	public static void main(String[] args) {
		Date now = new Date();
		System.out.println(getNextDate(now));
		System.out.println(getAfterDaysDate(now, 60));
	}
}
