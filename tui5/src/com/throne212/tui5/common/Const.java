package com.throne212.tui5.common;

public class Const {

	public static String SESS_RAND = "rand";
	public static String SESS_USER_OBJ = "userObj";
	public static String SESS_UPLOAD_IMGAGE = "uploadImage";
	public static String SESS_ALLIANCE_USER_ID = "ALL_USER_ID";//联盟推荐用户名
	
	public static String REQ_RETURN_URL = "returnurl";
	public static String REQ_CURR_NAV_INDEX = "currNav";
	
	//task status
	public static Integer TASK_STATUS_INIT = 0;
	public static Integer TASK_STATUS_WAITING = 1;
	public static Integer TASK_STATUS_PUBLISHED = 10;
	public static Integer TASK_STATUS_END = 2;
	public static Integer TASK_STATUS_COMPLETE = 5;
	
	//gaojian status
	public static Integer GAOJIAN_STATUS_INIT = 0;
	public static Integer GAOJIAN_STATUS_SUCC = 1;
	public static Integer GAOJIAN_STATUS_FAIL = 2;
	
	//page sizes
	public static int MEMBER_PAGE_SIZE = 20;
	public static int FRONT_PAGE_SIZE = 30;
	public static int FRONT_GAOJIAN_PAGE_SIZE = 30;
	
	//score
	public static int USER_REG_SCORE = 20;
	public static double USER_REG_MONEY = 1;
	
	//money,score,money_record type
	public static int RECORD_TYPE_1 = 1;//加
	public static int RECORD_TYPE_0 = 0;//减
	
	//money record status
	public static int MONEY_RECORD_APPLY = 1;//已申请
	public static int MONEY_RECORD_SUCC = 2;//完成
	public static int MONEY_RECORD_FAIL = 3;//失败
	
}
