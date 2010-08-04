package com.throne212.auto.dao;

import com.throne212.auto.domain.User;


public interface UserDao extends BaseDao{

	public User getUserByLoginName(String loginName);
	
}
