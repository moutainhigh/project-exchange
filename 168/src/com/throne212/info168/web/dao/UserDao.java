package com.throne212.info168.web.dao;

import com.throne212.info168.web.common.PageBean;
import com.throne212.info168.web.domain.User;

public interface UserDao extends BaseDao {
	public PageBean<User> getAllUsers(int page);

	public PageBean<User> queryUsersByKey(String key, int page);
}
