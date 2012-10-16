package com.throne212.tui5.dao;

import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.domain.Task;
import com.throne212.tui5.domain.User;

public interface TaskDao extends BaseDao{

	public PageBean<Task> getTaskList(Integer pageIndex, Integer status, User user);
	
}
