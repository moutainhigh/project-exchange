package com.throne212.fupin.action;

import java.util.List;

import com.throne212.fupin.biz.AdminBiz;
import com.throne212.fupin.domain.Shi;

public class AjaxAction extends BaseAction {

	private AdminBiz adminBiz;

	public String test() {
		return "msg";
	}

	private List list;

	// 获取所有市
	public String getAllShi() {
		list = adminBiz.getAll(Shi.class, "id", "asc");
		return "shi_list";

	}

	public AdminBiz getAdminBiz() {
		return adminBiz;
	}

	public void setAdminBiz(AdminBiz adminBiz) {
		this.adminBiz = adminBiz;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

}
