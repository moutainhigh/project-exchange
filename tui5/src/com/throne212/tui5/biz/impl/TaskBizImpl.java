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

	public PageBean<Task> getTaskList(Integer pageIndex, Integer status, User publisher) {
		return taskDao.getTaskList(pageIndex, status, publisher);
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

	public PageBean<Task> getMyTaskList(Integer pageIndex, User user) {
		return taskDao.getMyTaskList(pageIndex, user);
	}

	public PageBean<Gaojian> getGaojianList(Integer pageIndex, User user) {
		return taskDao.getGaojianList(pageIndex, user);
	}

	public List<Task> getTaskTop(int top, User user) {
		return taskDao.getTaskTop(top, user);
	}

	public List<Gaojian> getGaojianTop(int top, User user) {
		return taskDao.getGaojianTop(top, user);
	}
}
