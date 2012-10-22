package com.throne212.tui5.action;

import java.util.List;

import com.throne212.tui5.biz.TaskBiz;
import com.throne212.tui5.common.Const;
import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.domain.Gaojian;
import com.throne212.tui5.domain.Task;
import com.throne212.tui5.domain.Type;

public class TaskAction extends BaseAction {

	private TaskBiz taskBiz;

	private Long id;
	private Task t;
	private long gjAll;
	private long gjSucc;
	private long gjFail;
	private long gjUser;
	private List<Task> relateTasks;
	public String task() {
		if(id == null)
			return "404";
		t = taskBiz.getEntityByUnique(Task.class, "id", id);
		if(t == null)
			return "404";
		//所属类型
		Type type = t.getType();
		Type parentType = taskBiz.getEntityById(Type.class, type.getParentId());
		type.setParent(parentType);
		//稿件状态
		gjAll = taskBiz.getEntityCountByColumn(Gaojian.class, "task", t);
		gjSucc = taskBiz.getEntityCountByTwoColumn(Gaojian.class, "task", t, "status", Const.GAOJIAN_STATUS_SUCC);
		gjFail = taskBiz.getEntityCountByTwoColumn(Gaojian.class, "task", t, "status", Const.GAOJIAN_STATUS_FAIL);
		gjUser = taskBiz.getUserCountInTask(t);
		//相关其他任务
		relateTasks = taskBiz.getRelateTask(t);
		return "task";
	}
	
	private PageBean pageBean;
	private Integer pageIndex;
	public String gaojian(){
		if(id == null)
			return "404";
		t = taskBiz.getEntityByUnique(Task.class, "id", id);
		if(t == null)
			return "404";
		pageBean = taskBiz.getGaojianList(pageIndex, t);
		return "gaojian";
	}

	public TaskBiz getTaskBiz() {
		return taskBiz;
	}

	public void setTaskBiz(TaskBiz taskBiz) {
		this.taskBiz = taskBiz;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Task getT() {
		return t;
	}

	public void setT(Task t) {
		this.t = t;
	}

	public long getGjAll() {
		return gjAll;
	}

	public void setGjAll(long gjAll) {
		this.gjAll = gjAll;
	}

	public long getGjSucc() {
		return gjSucc;
	}

	public void setGjSucc(long gjSucc) {
		this.gjSucc = gjSucc;
	}

	public long getGjFail() {
		return gjFail;
	}

	public void setGjFail(long gjFail) {
		this.gjFail = gjFail;
	}

	public long getGjUser() {
		return gjUser;
	}

	public void setGjUser(long gjUser) {
		this.gjUser = gjUser;
	}

	public List<Task> getRelateTasks() {
		return relateTasks;
	}

	public void setRelateTasks(List<Task> relateTasks) {
		this.relateTasks = relateTasks;
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
