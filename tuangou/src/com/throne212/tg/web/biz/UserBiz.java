package com.throne212.tg.web.biz;

import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.domain.User;

public interface UserBiz extends BaseBiz{
	//登录
	public User login(String username,String pwd);
	//注册新用户
	public User regUser(User user, Long topArea);
	//修改密码
	public boolean changePwd(User user, String pwd);
	
	public PageBean<User> getAllUsers(int page);
	
}
