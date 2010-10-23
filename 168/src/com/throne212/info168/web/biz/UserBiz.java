package com.throne212.info168.web.biz;

import com.throne212.info168.web.domain.User;

public interface UserBiz extends BaseBiz{
	//登录
	public User login(String username,String pwd);
	//注册新用户
	public User regUser(User user, Long topArea);
	//修改密码
	public boolean changePwd(User user, String pwd);
	
}
