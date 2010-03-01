package com.throne212.proj.common;

public class WebConstants {
	
	/*common*/
	public static final int maxRowPerPage = 50;

	/* application attributes */
	public static final String APP_PATH = "appPath";
	public static final String APP_TITLE = "appTitle";

	/* session attributes */
	public static final String SESS_USER_NAME = "userName";
	public static final String SESS_USER_OBJ = "userObj";
	
	public static final String SESS_MODULE_LIST = "moduleList";
	public static final String SESS_MODULE_CURR = "currModule";
	public static final String SESS_PAGE_LIST = "pageList";
	public static final String SESS_PAGE_CURR = "currPage";
	
	/* request attributes */
	public static final String REQ_STATUS = "reqStatus";
	public static final String REQ_STATUS_SUCC_TEXT = "Complete-Successfully";
	public static final String REQ_STATUS_FAIL_TEXT = "Complete-Failed";
	public static final String REQ_MSG = "reqMsg";
	
	/* forms status */
	public static final int 	FORM_DRAFT = 1;
	public static final String 	FORM_DRAFT_TEXT = "Draft";
	public static final int 	FORM_SENT = 2;
	public static final String 	FORM_SENT_TEXT = "Sent To Office";
	public static final int 	FORM_FEEDBACK = 3;
	public static final String 	FORM_FEEDBACK_TEXT = "Be Corrected";
	public static final int 	FORM_COMPLETE = 4;
	public static final String 	FORM_COMPLETE_TEXT = "Completed";
	
	public static final String REQUEST_KEY_DOWNLOAD_FILE_PATH = "download_file_path";
	public static final String REQUEST_KEY_DOWNLOAD_FILE_NAME = "download_file_name";
	public static final String REQUEST_KEY_DOWNLOAD_CONTENT_TYPE = "download_content_type";
	public static final String REQUEST_KEY_DOWNLOAD_BUFFER_SIZE = "download_buffer_size";
	
	public static final String STRUTS2_GLOBAL_RESULT_DOWNLOAD = "download";
	
	/* form catalog */
	public static final String REQ_FORM_CATALOG_LIST = "formCatalogs";
	public static final String REQ_FORM_FORM_TYPES = "formTypes";
}
