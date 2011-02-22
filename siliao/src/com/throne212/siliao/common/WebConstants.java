package com.throne212.siliao.common;

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
	public static final String USER_NAME_ADMIN = "系统管理员";
	public static final String USER_NAME_MANAGER = "饲料经理";
	public static final String USER_NAME_PROVIDER = "供应饲料厂负责人";
	public static final String USER_NAME_AREA = "管区厂负责人";
	
	public static final String OP_CREATE = "创建";
	public static final String OP_UPDATE = "更新";
	public static final String OP_DELETE = "删除";
	
	public static final String RATE_TYPE_FARM = "f";//农场
	public static final String RATE_TYPE_PROVIDER = "p";//供应厂
	
	public static final int PAGE_SIZE = 20;
	
	
	
}