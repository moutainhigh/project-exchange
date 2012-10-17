package com.throne212.tui5.biz;

import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.domain.Task;
import com.throne212.tui5.domain.User;

public interface TaskBiz extends BaseBiz{

	public Task publishTask(Task task);
	
	public PageBean<Task> getTaskList(Integer pageIndex, Integer status, User user);
	
	public PageBean<Task> getTaskList(Integer pageIndex, Integer... status);
	
}
