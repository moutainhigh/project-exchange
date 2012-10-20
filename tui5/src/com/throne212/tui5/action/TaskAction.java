package com.throne212.tui5.action;

import com.throne212.tui5.biz.TaskBiz;
import com.throne212.tui5.domain.Task;

public class TaskAction extends BaseAction {

	private TaskBiz taskBiz;

	private Long id;
	private Task t;
	
	public String task() {
		if(id == null)
			return "404";
		t = taskBiz.getEntityByUnique(Task.class, "id", id);
		if(t == null)
			return "404";
		return "task";
	}
	
	public String gaojian(){
		if(id == null)
			return "404";
		t = taskBiz.getEntityByUnique(Task.class, "id", id);
		if(t == null)
			return "404";
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

}
