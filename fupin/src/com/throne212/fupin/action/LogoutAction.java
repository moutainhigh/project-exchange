package com.throne212.fupin.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.User;


public class LogoutAction extends BaseAction {

	public String execute() {
		
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof AreaWorkOrg){
			AreaWorkOrg a = (AreaWorkOrg) user;
			if("Y".equals(a.getIsDiv())){
				ActionContext.getContext().getSession().remove(WebConstants.SESS_USER_OBJ);
				return "success_baiyun";
			}
		}
		
		ActionContext.getContext().getSession().remove(WebConstants.SESS_USER_OBJ);
		return "success";
	}

}
