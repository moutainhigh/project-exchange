package com.throne212.tg.web.dao;

import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.domain.User;

public interface UserDao extends BaseDao {
	public PageBean<User> getAllUsers(int page);

	public PageBean<User> queryUsersByKey(String key, int page);
}
