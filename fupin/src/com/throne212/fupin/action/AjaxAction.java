package com.throne212.fupin.action;

import java.util.List;

import com.throne212.fupin.biz.AdminBiz;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.Shi;
import com.throne212.fupin.domain.Zhen;

public class AjaxAction extends BaseAction {

	private AdminBiz adminBiz;

	public String test() {
		return "msg";
	}

	private List list;

	// 获取所有市
	public String getAllShi() {
		list = adminBiz.getAll(Shi.class, "id", "asc");
		return "list";
	}
	private Long parentId;
	public String getAllArea() {
		list = adminBiz.getEntitiesByColumn(Area.class, "shi", adminBiz.getEntityById(Shi.class, parentId));
		return "list";
	}
	public String getAllZhen() {
		list = adminBiz.getEntitiesByColumn(Zhen.class, "area", adminBiz.getEntityById(Area.class, parentId));
		return "list";
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
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

}
