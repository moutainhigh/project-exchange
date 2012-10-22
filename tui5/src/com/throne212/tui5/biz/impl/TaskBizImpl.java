package com.throne212.tui5.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.throne212.tui5.biz.TaskBiz;
import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.dao.BaseDao;
import com.throne212.tui5.dao.TaskDao;
import com.throne212.tui5.domain.Gaojian;
import com.throne212.tui5.domain.Task;
import com.throne212.tui5.domain.Type;
import com.throne212.tui5.domain.User;

@Service("taskBiz")
public class TaskBizImpl extends BaseBizImpl implements TaskBiz {

	@Autowired
	private BaseDao baseDao;
	@Autowired
	private TaskDao taskDao;

	public Task publishTask(Task task) {
		baseDao.saveOrUpdate(task);
		return task;
	}

	public PageBean<Task> getTaskList(Integer pageIndex, Integer status, User user) {
		return taskDao.getTaskList(pageIndex, status, user);
	}

	public PageBean<Task> getTaskList(Integer pageIndex, Integer... status) {
		return taskDao.getTaskList(pageIndex, status);
	}

	public PageBean<Task> getTaskList(Integer pageIndex, Type t, Integer... status) {
		return taskDao.getTaskList(pageIndex, t, status);
	}

	public List<Task> getEndingTask(int min) {
		return taskDao.getEndingTask(min);
	}

	public long getUserCountInTask(Task t) {
		return taskDao.getUserCountInTask(t);
	}

	public List<Task> getRelateTask(Task t) {
		return taskDao.getRelateTask(t);
	}

	public PageBean<Gaojian> getGaojianList(Integer pageIndex, Task task) {
		return taskDao.getGaojianList(pageIndex, task);
	}
}
