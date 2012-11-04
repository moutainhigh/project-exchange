package com.throne212.tui5.dao;

import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.domain.Alliance;
import com.throne212.tui5.domain.User;


public interface AllianceDao extends BaseDao {

	public PageBean<Alliance> getTaskList(Integer pageIndex, User user);

}
