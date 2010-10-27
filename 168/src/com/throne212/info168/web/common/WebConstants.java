package com.throne212.info168.web.common;

public class WebConstants {
	
	public static final String WEB_PATH;
	static{
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "xml";
		WEB_PATH = path;
	}
	//app
	public static final String TOP_AREA_LIST = "topAreaList";
	public static final String CITY_BY_PINYIN = "allCities";
	public static final String APP_PATH = "appPath";
	public static final String APP_TITLE = "appTitle";
	public static final String APP_DESC = "appDesc";
	public static final String APP_KEY_WORDS = "appKeywords";
	//session
	public static final String SESS_RAND = "rand";
	public static final String SESS_USER_OBJ = "userObj";
	public static final String SESS_CITY = "currCity";
}
