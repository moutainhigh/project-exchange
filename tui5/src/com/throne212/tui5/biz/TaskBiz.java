package com.throne212.tui5.biz;

import java.util.List;

import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.domain.Gaojian;
import com.throne212.tui5.domain.Task;
import com.throne212.tui5.domain.Type;
import com.throne212.tui5.domain.User;

public interface TaskBiz extends BaseBiz {

	public Task publishTask(Task task);

	public PageBean<Task> getTaskList(Integer pageIndex, Integer status, User user);

	public PageBean<Task> getTaskList(Integer pageIndex, Integer... status);

	public PageBean<Task> getTaskList(Integer pageIndex, Type t, Integer... status);

	public List<Task> getEndingTask(int min);

	public long getUserCountInTask(Task t);

	public List<Task> getRelateTask(Task t);

	public PageBean<Gaojian> getGaojianList(Integer pageIndex, Task task);

}
