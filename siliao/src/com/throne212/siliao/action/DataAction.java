package com.throne212.siliao.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.siliao.biz.BaseBiz;
import com.throne212.siliao.biz.UserBiz;
import com.throne212.siliao.common.EncryptUtil;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.domain.User;

public class DataAction extends BaseAction {

	private BaseBiz baseBiz;
	
	public String updateMailSetting(){
		
		return "mail_setting";
	}

}
