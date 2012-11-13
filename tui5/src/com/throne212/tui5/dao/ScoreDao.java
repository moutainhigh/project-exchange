package com.throne212.tui5.dao;

import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.domain.Task;
import com.throne212.tui5.domain.User;

public interface ScoreDao extends BaseDao {

	public PageBean<Task> getMyScore(Integer pageIndex, User user);
	
	public PageBean<Task> getMyFinance(Integer pageIndex, User user, int... type);
	
	public PageBean getMyMoneyRecords(Integer pageIndex, User user);

}
