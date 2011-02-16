package com.throne212.siliao.biz;

import com.throne212.siliao.domain.User;

public interface UserBiz extends BaseBiz{
	//登录
	public User login(String username,String pwd);
	//修改密码
	public boolean changePwd(User user, String pwd);
}
