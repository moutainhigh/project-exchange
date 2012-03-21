package com.throne212.fupin.action;

import com.throne212.fupin.common.PageBean;


public class QuestionManagementAction extends BaseAction {
	
	private PageBean pageBean;
	private Integer pageIndex;
	private Long areaId;
	private Long zhenId;
	private Long cunId;
	
	public String list1(){
		
		return "list1";
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public Long getAreaId() {
		return areaId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
	}

	public Long getZhenId() {
		return zhenId;
	}

	public void setZhenId(Long zhenId) {
		this.zhenId = zhenId;
	}

	public Long getCunId() {
		return cunId;
	}

	public void setCunId(Long cunId) {
		this.cunId = cunId;
	}
	
}
