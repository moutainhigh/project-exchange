package com.throne212.tg.web.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tg.web.common.WebConstants;
import com.throne212.tg.web.domain.User;

public class UserCenterAction extends BaseAction {
	
	public String enter() {
		
		User user=(User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user==null) {
			this.setMsg("请先登录！");
			return "login";
		}
		return "entered";
	}
	
	public String showInfoChange() {
		
		User user=(User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user==null) {
			this.setMsg("请先登录！");
			return "login";
		}
		return "showInfoChange";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
