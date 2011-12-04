package com.throne212.wz.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.wz.common.Consts;

public class LogoutAction extends BaseAcion {

	public String execute(){
		ActionContext.getContext().getSession().put(Consts.SESS_USER_OBJ, null);
		return "success";
	}
	
}
