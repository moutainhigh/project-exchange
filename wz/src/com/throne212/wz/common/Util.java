package com.throne212.wz.common;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Set;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.hibernate.id.GUIDGenerator;

import com.sun.image.codec.jpeg.ImageFormatException;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

//tool class
public class Util {
	private static Logger logger = Logger.getLogger(Util.class);

	public static String notNull(String inStr) {
		return ((inStr == null || inStr.length() == 0) ? "" : inStr.trim());
	}
	public static Date getDate(String dateTxt) throws ParseException {
		if (!isEmpty(dateTxt)) {
			dateTxt = dateTxt.replaceAll("\"", "");
		}
		try {
			return new SimpleDateFormat("yyyy-M").parse(dateTxt);
		} catch (Exception e1) {
			try {
				return new SimpleDateFormat("yyyy-M-d").parse(dateTxt);
			} catch (Exception e2) {
				try {
					return new SimpleDateFormat("yyyy.M").parse(dateTxt);
				} catch (Exception e3) {
					try {
						return new SimpleDateFormat("yyyy.M.d").parse(dateTxt);
					} catch (Exception e4) {
					}
				}
			}
		}
		return null;
	}

	public static String getCurrentDate() {
		return getDate(new Date());
	}

	public static Date getDateOnly(Date date) {
		return new Date(date.getYear(), date.getMonth(), date.getDate());
	}

	public static String getDate(Date date) {
		if (date == null)
			return null;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		return dateFormat.format(date);
	}

	public static Date getDateByTxt(String dateTxt) throws ParseException {
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			return dateFormat.parse(dateTxt);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static Date getDateByTxtNoDay(String dateTxt) throws ParseException {
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
			return dateFormat.parse(dateTxt);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static Date getDateByTxtInExcel(String dateTxt) throws ParseException {
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
			return dateFormat.parse(dateTxt);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static String getCurrentDateTime() {
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
		return dateFormat.format(date);
	}

	public static Date getNextDay(Date date) {
		long time = date.getTime() + 24 * 60 * 60 * 1000 - 1;
		return new Date(time);
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

	public static void writeImage(InputStream in, OutputStream out) throws Exception {
		Image src = ImageIO.read(in);
		int h = src.getHeight(null);
		int w = src.getWidth(null);
		BufferedImage tag = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
		tag.getGraphics().drawImage(src, 0, 0, w, h, null);
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
		encoder.encode(tag);
	}

	public static void writeImage(InputStream in, OutputStream out, int maxWidth, int maxHeight) {
		try {
			Image src = ImageIO.read(in);
			int h = src.getHeight(null);
			int w = src.getWidth(null);
			// case 1
			if (h <= maxHeight && w <= maxWidth) {

			}
			// case 2
			else if (h > maxHeight && w <= maxWidth) {
				h = maxHeight;
				w = h * (maxWidth / maxHeight);
			}
			// case 3
			else if (h <= maxHeight && w > maxWidth) {
				w = maxWidth;
				h = w * maxHeight / maxWidth;
			}
			// case 4
			else if (h > maxHeight && w > maxWidth) {
				if (h / maxHeight > w / maxWidth) {
					w = w * maxHeight / h;
					h = maxHeight;
				} else {
					h = h * maxWidth / w;
					w = maxWidth;
				}
			}
			BufferedImage tag = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
			tag.getGraphics().drawImage(src, 0, 0, w, h, null);
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
			encoder.encode(tag);
		} catch (ImageFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static String generateOrderNo() {
		SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		return fmt.format(new Date()).toString();
	}

	public static double addMoney(double d1, double d2) {
		BigDecimal m1 = new BigDecimal(Double.toString(d1));
		BigDecimal m2 = new BigDecimal(Double.toString(d2));
		return roundMoney(m1.add(m2).doubleValue());
	}

	public static double subMoney(double d1, double d2) {
		BigDecimal m1 = new BigDecimal(Double.toString(d1));
		BigDecimal m2 = new BigDecimal(Double.toString(d2));
		return roundMoney(m1.subtract(m2).doubleValue());
	}

	public static double multiplyMoney(double d1, double d2) {
		BigDecimal m1 = new BigDecimal(Double.toString(d1));
		BigDecimal m2 = new BigDecimal(Double.toString(d2));
		return roundMoney(m1.multiply(m2).doubleValue());
	}

	public static double roundMoney(double val) {
		long b = (long) Math.round(val * 100);
		return (double) b / 100.00;
	}

	public static double calRateMoney(double money, double rate, Date fromDate) {
		long days = (System.currentTimeMillis() - fromDate.getTime()) / 1000 / 60 / 60 / 24;
		double rateMoney = 0;
		double ratePerDay = rate / 30;
		for (long j = 0; j < days; j++) {
			rateMoney += ratePerDay * money;
		}
		return rateMoney;
	}

	public static double calTotalMoney(double money, double rate, Date fromDate) {
		long days = (System.currentTimeMillis() - fromDate.getTime()) / 1000 / 60 / 60 / 24;
		double rateMoney = 0;
		double ratePerDay = rate / 30;
		for (long j = 0; j < days; j++) {
			rateMoney += ratePerDay * money;
		}
		return addMoney(money, rateMoney);
	}

	private static final int Int_WORD = 1;
	private static final int STRING_WORD = 2;
	private static final int MIX_WORD = 3;

	public static String getPassWord(int style, int length) {
		if (style == Int_WORD) {
			return getIntRandom(length);
		} else if (style == STRING_WORD) {
			return getCharRandom(length);
		} else if (style == MIX_WORD) {
			return getMixRandom(length);
		}
		return getMixRandom(length);
	}

	private static String getIntRandom(int length) {
		int[] array = new int[length];
		StringBuilder str = new StringBuilder();
		for (int i = 0; i < length; i++) {
			array[i] = (int) (Math.random() * 10);
			str.append(array[i]);
		}
		return str.toString();
	}

	private static String getCharRandom(int length) {
		int[] array = new int[length];
		char[] chars = new char[length];
		StringBuilder str = new StringBuilder();
		for (int i = 0; i < length; i++) {
			while (true) {
				array[i] = (int) (Math.random() * 1000);
				if ((array[i] > 64 && array[i] < 91) || (array[i] > 96 && array[i] < 123))
					break;
			}
			chars[i] = (char) array[i];
			str.append(chars[i]);
		}
		return str.toString();
	}

	private static String getMixRandom(int length) {
		int[] array = new int[length];
		char[] chars = new char[length];
		StringBuilder str = new StringBuilder();
		int temp = 0;
		for (int i = 0; i < length; i++) {
			while (true) {
				temp = (int) (Math.random() * 1000);
				if (temp < 128)
					break;
			}
			array[i] = temp;
			chars[i] = (char) array[i];
			str.append(chars[i]);
		}
		return str.toString();
	}

	
}
