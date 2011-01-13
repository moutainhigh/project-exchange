package com.throne212.tg.web.common;

public class WebConstants {
	
	public static final String WEB_PATH;
	static{
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "xml";
		WEB_PATH = path;
	}
	
	public static final String APP_PATH = "appPath";
	public static final String APP_TITLE = "appTitle";
	public static final String APP_DESC = "appDesc";
	public static final String APP_KEY_WORDS = "appKeywords";
	public static final String APP_CITIES = "cities";
	public static final String APP_CATEGOTIES = "cates";
	public static final String APP_IMG_SAVED_PATH="imgSavedPath";
	
	//session
	public static final String SESS_USER_OBJ = "userObj";
	public static final String SESS_CITY = "currCity";
	public static final String SESS_IMAGE = "sess_image";
	//前台web parameter
	public static final int NUM_PER_CATE=9;//每种类型的团购信息在首页显示最新10条
	public static final String DEFAULT_CITY_NAME="全国";//默认城市名
	public static final int NUM_PER_FRONT_PAGE_TEAM=9;// 前台每页团购信息记录数目
	//后台配置
	public static final int NUM_PER_BACK_PAGE_TEAM=10;//  后台每页团购信息记录数目
	public static final int NUM_PER_BACK_PAGE_SITE=5;//  后台每页团购网站记录数目
	public static final int NUM_PER_BACK_PAGE_USER=5;//后台每页用户信息记录数目
	public static final int NUM_PER_BACK_PAGE_CATE=2;//后台每页分类信息记录数目
	public static final int NUM_PER_BACK_PAGE_CITY=2;//后台每页城市信息记录数目
}
