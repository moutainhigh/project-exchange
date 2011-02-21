package com.throne212.siliao.action;

import java.util.List;

import com.throne212.siliao.biz.BaseBiz;
import com.throne212.siliao.domain.Area;


public class AjaxAction extends BaseAction {
	
	private BaseBiz baseBiz;
	public BaseBiz getBaseBiz() {
		return baseBiz;
	}

	public void setBaseBiz(BaseBiz baseBiz) {
		this.baseBiz = baseBiz;
	}

	public String test() {
		return "msg";
	}
	
	//获取所有的管区
	private List list;
	public String getAllArea() {
		list = baseBiz.getAll(Area.class, "id", "asc");
		return "area_list";
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
	
	
	


}
