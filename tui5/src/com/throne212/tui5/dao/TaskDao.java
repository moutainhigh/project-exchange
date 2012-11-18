package com.throne212.tui5.dao;

import java.util.List;

import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.domain.Gaojian;
import com.throne212.tui5.domain.Task;
import com.throne212.tui5.domain.Type;
import com.throne212.tui5.domain.User;

public interface TaskDao extends BaseDao {

	public PageBean<Task> getTaskList(Integer pageIndex, Integer status, User publisher);

	public PageBean<Task> getTaskList(Integer pageIndex,String sort, Integer... status);

	public PageBean<Task> getTaskList(Integer pageIndex,String sort, Type t, Integer... status);
	
	public PageBean<Task> getWeiboList(Integer pageIndex, Integer status, Integer wbType, String sort);

	public List<Task> getEndingTask(int min);

	public long getUserCountInTask(Task t);

	public List<Task> getRelateTask(Task t);

	public PageBean<Gaojian> getGaojianList(Integer pageIndex, Task task);

	public PageBean<Task> getMyTaskList(Integer pageIndex, User user);

	public PageBean<Gaojian> getGaojianList(Integer pageIndex, User user);

	public List<Task> getTaskTop(int top, User user);
	
	public List<Task> getTaskTop(int top, Integer status);

	public List<Gaojian> getGaojianTop(int top, User user);

}
