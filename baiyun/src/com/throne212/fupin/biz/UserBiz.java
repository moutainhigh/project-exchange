package com.throne212.fupin.biz;

import com.throne212.fupin.domain.User;


public interface UserBiz extends BaseBiz {
	//登录
	public User login(String username,String pwd);
	//修改密码
	public boolean changePwd(User user, String pwd);
}
