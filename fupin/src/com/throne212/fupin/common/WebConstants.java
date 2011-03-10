package com.throne212.fupin.common;

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

	public static final String APP_PATH = "appPath";
	public static final String APP_TITLE = "appTitle";
	public static final String APP_DESC = "appDesc";
	public static final String APP_KEY_WORDS = "appKeywords";
	
	//session
	public static final String SESS_USER_OBJ = "userObj";
	public static final String SESS_CITY = "currCity";
	public static final String SESS_IMAGE = "sess_image";
	

	//措施类型
	public static final String CUOSHI_TYPE_YEAR="年度措施";
	public static final String CUOSHI_TYPE_SEASON="季度措施";
	
	
	//审核状态
	public static final String SHENHE_STATUS_UNCOMMIT="未提交";
	public static final String SHENHE_STATUS_PROCECING="审核中";
	public static final String SHENHE_STATUS_PASS="审核通过";
	public static final String SHENHE_STATUS_UNPASS="审核不通过";
	
	
	//图片类型
	public static final String PIC_TYPE_BEFORE="帮扶前";
	public static final String PIC_TYPE_AFTER="帮扶后";
	
	public static final String POOR_TYPE_1 = "年人均收入1501-2500元的帮扶对象";
	public static final String POOR_TYPE_2 = "纳入低保无劳动力的贫困户";
	public static final String POOR_TYPE_3 = "纳入低保尚有劳动力的贫困户";
	
	//每页条数
	public static final int PAGE_SIZE = 20;
	
	
}