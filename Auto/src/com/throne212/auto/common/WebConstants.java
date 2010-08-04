package com.throne212.auto.common;

public class WebConstants {
	
	/*common*/
	public static final int maxRowPerPage = 20;

	/* application attributes */
	public static final String APP_PATH = "appPath";
	public static final String APP_TITLE = "appTitle";
	public static final String APP_PERMISSIONS = "appPers";

	/* session attributes */
	public static final String SESS_USER_NAME = "userName";
	public static final String SESS_USER_OBJ = "userObj";
	public static final String SESS_USER_IS_EMPLOEE = "isEmployee";
	public static final String SESS_RAND = "rand";
	public static final String SESS_PERMISSIONS = "sessPers";	
	
	public static final String SESS_PER_CURR = "currPer";
	public static final String SESS_PER_TOP = "topPer";
	public static final String SESS_PER_SEC = "secPer";
	public static final String SESS_PER_THD = "thdPer";
	
	/* request attributes */
	public static final String REQ_MSG = "reqMsg";
	
	/* forms status */
	public static final int 	FORM_NORMAL = 1;
	public static final String 	FORM_NORMAL_TEXT = "正常";
	public static final int 	FORM_UNREG = 2;
	public static final String 	FORM_UNREG_TEXT = "已注销";
	
}
