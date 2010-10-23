package com.throne212.info168.web.biz;

import com.throne212.info168.web.domain.User;

public interface UserBiz extends BaseBiz{

	public User login(String username,String pwd);
	
}
