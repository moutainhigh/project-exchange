package com.throne212.jianzhi8.biz;

import com.throne212.jianzhi8.domain.User;

public interface UserBiz {

	public User login(String username,String password);
	
	public User reg(String username,String password);
	
}
