package com.throne212.auto.biz;

import com.throne212.auto.domain.User;

public interface UserBiz extends BaseBiz{

	public User login(String loginName, String password);
	
	public boolean changePwd(Long userId,String oldPwd,String newPwd);
	
}
