package com.throne212.saishi.action;

import java.util.ArrayList;
import java.util.List;

import com.throne212.saishi.biz.BaseBiz;
import com.throne212.saishi.common.WebConstants;

public class AjaxAction extends BaseAction {


	private BaseBiz baseBiz;
	public String test() {
		return "msg";
	}

	private List list;

	public String getRoleList() {
		list = new ArrayList();
		list.add(WebConstants.USER_NAME_ADMIN);
		list.add(WebConstants.USER_NAME_MANAGER);
		return "role_list";
	}

	public BaseBiz getBaseBiz() {
		return baseBiz;
	}

	public void setBaseBiz(BaseBiz baseBiz) {
		this.baseBiz = baseBiz;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
	

	
	

}
