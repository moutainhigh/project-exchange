package com.throne212.tui5.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.throne212.tui5.biz.TaskBiz;
import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.dao.BaseDao;
import com.throne212.tui5.dao.TaskDao;
import com.throne212.tui5.domain.Task;
import com.throne212.tui5.domain.Type;
import com.throne212.tui5.domain.User;

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
	
	public PageBean<Task> getTaskList(Integer pageIndex, Integer status, User user){
		return taskDao.getTaskList(pageIndex, status, user);
	}
	
	public PageBean<Task> getTaskList(Integer pageIndex, Integer... status){
		return taskDao.getTaskList(pageIndex, status);
	}
	
	public PageBean<Task> getTaskList(Integer pageIndex,Type t, Integer... status){
		return taskDao.getTaskList(pageIndex, t, status);
	}
	
}
