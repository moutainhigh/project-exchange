package com.throne212.wz.biz;

import com.throne212.wz.domain.User;

public interface UserBiz {

	public User login(String username,String password);
	
	public User reg(String username,String password);
	
}
