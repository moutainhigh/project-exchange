package com.throne212.wz.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.throne212.wz.dao.UserDAO;

@Service("commonBiz")
@Transactional
public class CommonBiz {
	
	private UserDAO userDAO;

	@Autowired
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}


	public UserDAO getUserDAO() {
		return userDAO;
	}
	
}
