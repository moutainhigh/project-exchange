package com.throne212.saishi.action;

import com.throne212.saishi.biz.DataBiz;
import com.throne212.saishi.common.PageBean;


public class StatAction extends BaseAction {
	
	private DataBiz dataBiz;
	private PageBean pageBean;
	private Integer pageIndex;
	
	public DataBiz getDataBiz() {
		return dataBiz;
	}

	public void setDataBiz(DataBiz dataBiz) {
		this.dataBiz = dataBiz;
	}

	public String online(){
		return "online";
	}

	public String install(){
		pageBean = dataBiz.getInstallLog(pageIndex);
		return "install";
	}
	
	public String uninstall(){
		pageBean = dataBiz.getUninstallLog(pageIndex);
		return "uninstall";
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

	
	
}
