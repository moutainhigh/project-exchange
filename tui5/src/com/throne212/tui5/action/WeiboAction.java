package com.throne212.tui5.action;

import com.throne212.tui5.biz.TaskBiz;
import com.throne212.tui5.common.Const;
import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.domain.Task;

public class WeiboAction extends BaseAction {

	private TaskBiz taskBiz;

	private PageBean<Task> pageBean;
	private Integer pageIndex;
	private Integer wbType;
	private String sort;

	public String index() {
		pageBean = taskBiz.getWeiboList(pageIndex, Const.TASK_STATUS_PUBLISHED, wbType, sort);
		return "weibo_list";
	}

	public TaskBiz getTaskBiz() {
		return taskBiz;
	}

	public void setTaskBiz(TaskBiz taskBiz) {
		this.taskBiz = taskBiz;
	}

	public PageBean<Task> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<Task> pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public Integer getWbType() {
		return wbType;
	}

	public void setWbType(Integer wbType) {
		this.wbType = wbType;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

}
