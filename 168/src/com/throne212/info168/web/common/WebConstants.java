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
	public static final String HOT_CITIES = "hotCities";
	public static final String FREIND_LINKS = "links";
	public static final String KEY_WORD_LIST = "sys_keywords";
	public static final String ALL_CATES = "allCates";
	public static final String APP_PATH = "appPath";
	public static final String APP_TITLE = "appTitle";
	public static final String APP_DESC = "appDesc";
	public static final String APP_KEY_WORDS = "appKeywords";
	
	//session
	public static final String SESS_USER_OBJ = "userObj";
	public static final String SESS_CITY = "currCity";
	public static final String SESS_IMAGE = "sess_image";
	
	
	//other
	public static final int INFO_LIST_ROWS = 10;
	public static final int INFO_LIST_ROWS_SEARCH = 20;
	public static final int INFO_LIST_ROWS_ADMIN = 20;
	public static final int USER_LIST_ROWS_ADMIN = 20;
	
	
}