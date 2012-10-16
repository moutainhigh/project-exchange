package com.throne212.tui5.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.throne212.tui5.biz.TaskBiz;
import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.dao.BaseDao;
import com.throne212.tui5.dao.TaskDao;
import com.throne212.tui5.domain.Task;

@Service("taskBiz")
public class TaskBizImpl extends BaseBizImpl implements TaskBiz{
	
	@Autowired
	private BaseDao baseDao;
	@Autowired
	private TaskDao taskDao;

	public Task publishTask(Task task) {
		baseDao.saveOrUpdate(task);
		return task;
	}
	
	public PageBean<Task> getTaskList(Integer pageIndex, Integer status){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return taskDao.getTaskList(pageIndex, status);
	}
	
}
