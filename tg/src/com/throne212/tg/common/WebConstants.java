package com.throne212.tg.common;

public class WebConstants {
	public static final String xmlpath;
	static{
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "xml";
		xmlpath = path;
		//xmlpath = "D:\\tmp";
	}
	
}
