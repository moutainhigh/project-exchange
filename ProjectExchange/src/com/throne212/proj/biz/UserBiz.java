package com.throne212.proj.biz;

import com.throne212.proj.domain.User;
//关于用户的业务
public interface UserBiz {

	// 登录
	public User login(String loginName, String password);

}
