package com.throne212.siliao.common;

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
import java.util.Date;

import javax.imageio.ImageIO;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.sun.image.codec.jpeg.ImageFormatException;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.throne212.siliao.domain.Log;
import com.throne212.siliao.domain.User;

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
	public static void writeImage(InputStream in, OutputStream out) throws Exception {
		Image src = ImageIO.read(in); // ����Image����
		int h = src.getHeight(null);
		int w = src.getWidth(null);
		BufferedImage tag = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
		tag.getGraphics().drawImage(src, 0, 0, w, h, null); // ������С���ͼ
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
		encoder.encode(tag); // ��JPEG����
	}
	public static void writeImage(InputStream in, OutputStream out,int maxWidth, int maxHeight) {
		try {
			Image src = ImageIO.read(in); // ����Image����
			int h = src.getHeight(null);
			int w = src.getWidth(null);
			// case 1
			if(h <= maxHeight && w <= maxWidth){
				
			}
			//case 2
			else if(h > maxHeight && w <= maxWidth){
				h = maxHeight;
				w = h * (maxWidth/maxHeight);
			}
			//case 3
			else if(h <= maxHeight && w > maxWidth){
				w = maxWidth;
				h = w * maxHeight / maxWidth;
			}
			//case 4
			else if(h > maxHeight && w > maxWidth){
				if(h/maxHeight > w/maxWidth){
					w = w * maxHeight / h;
					h = maxHeight;					
				}else{
					h = h * maxWidth / w;
					w = maxWidth;					
				}
			}
			BufferedImage tag = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
			tag.getGraphics().drawImage(src, 0, 0, w, h, null); // ������С���ͼ
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
			encoder.encode(tag); // ��JPEG����
		} catch (ImageFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static String generateOrderNo(){
		SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		return fmt.format(new Date()).toString();
	}
	//获取日志基础数据
	public static <T extends Log> T getBaseLog(Class<T> logClass,String msg){
		Log log = null;
		try {
			log = logClass.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} 
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		log.setByWho(user);
		log.setCreateDate(new Date());
		log.setCreateName(user.getName());
		log.setEnable(true);
		log.setLogTime(new Date());
		log.setMsg(msg);
		return (T) log;
	}
	//生成单据号
	public static String genOrderId(String str1,String str2,long num){
		if(str1==null || str2==null){
			return null;
		}
		StringBuffer sb = new StringBuffer();
		
		sb.append(PinyinToolkit.cn2PinyinOnly2Char(str1).toUpperCase());
		sb.append(PinyinToolkit.cn2PinyinOnly2Char(str2).toUpperCase());
		
		String str = num+"";
		int len = 6-str.length();
		for(int i = 0; i<len;i++){
			str = "0" + str;
		}
		
		sb.append(str);
		
		return sb.toString();		
	}
	
	public static double addMoney(double d1,double d2){
		BigDecimal m1 = new BigDecimal(Double.toString(d1));
		BigDecimal m2 = new BigDecimal(Double.toString(d2));
		return roundMoney(m1.add(m2).doubleValue());
	}
	
	public static double roundMoney(double val){
		long b = (long)Math.round(val * 100); //小数点后两位前移，并四舍五入 
		return (double)b / 100.00; //还原小数点后两位
	}
	
	public static void main(String[] args) {
//		Date now = new Date();
//		System.out.println(getDate(getDateOnly(now)));
//		System.out.println(generateOrderNo());
//		System.out.println(genOrderId("北海农场","天邦",1));
		System.out.println(roundMoney(23.2983242));
	}
}
