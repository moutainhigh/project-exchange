package com.throne212.saishi.common;

public class WebConstants {
	
	public static final String WEB_PATH;
	static{
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "xml";
		WEB_PATH = path;
	}
	//app

	

	public static final String KEY_WORD_LIST = "sys_keywords";
	public static final String APP_PATH = "appPath";
	public static final String APP_TITLE = "appTitle";
	public static final String APP_DESC = "appDesc";
	public static final String APP_KEY_WORDS = "appKeywords";
	
	//session
	public static final String SESS_USER_OBJ = "userObj";
	public static final String SESS_MUSIC="music";
	public static final String SESS_MUSIC_SIZE="musicSize";

	
	//userRole
	public static final String USER_NAME_ADMIN="超级管理员";
	public static final String USER_NAME_MANAGER="系统管理员";
	
	public static final int PAGE_SIZE = 20;
	
	
	
}