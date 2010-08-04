package com.throne212.auto.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;

public class Util {
	private static Logger logger = Logger.getLogger(Util.class);

	public static String getCurrentDate() {
		return getDate(new Date());
	}
	public static Date getDateOnly(Date date) {
		return new Date(date.getYear(),date.getMonth(),date.getDate());
	}
	public static String getDate(Date date) {
		if(date == null)
			return null;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		return dateFormat.format(date);
	}
	public static Date getDateByTxt(String dateTxt) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		return dateFormat.parse(dateTxt);
	}

	public static String getCurrentDateTime() {
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
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
	
	public static boolean isNum(String str) {
		return str.matches("[0-9]{1,}");
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
	
	public static Date getNextDate(Date d){
		return getAfterDaysDate(d,1);
	}
	
	public static Date getAfterDaysDate(Date d, int days){
		long addTime = 1;
		addTime *= days; 
		addTime *= 24; 
		addTime *= 60; 
		addTime *= 60; 
		addTime *= 1000;
		return new Date(d.getTime() + addTime);
	}
	public static void main(String[] args) {
		Date now = new Date();
		System.out.println(getDate(getDateOnly(now)));
	}
}
