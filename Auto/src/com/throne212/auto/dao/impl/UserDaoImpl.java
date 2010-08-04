package com.throne212.auto.dao.impl;

import com.throne212.auto.dao.UserDao;
import com.throne212.auto.domain.User;

public class UserDaoImpl extends BaseDaoImpl implements UserDao {

	public User getUserByLoginName(String loginName) {
		return super.getEntityByUniqueColumn(User.class, "loginName", loginName);
	}

}
