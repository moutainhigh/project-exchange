package com.throne212.wz.biz;

import com.throne212.wz.domain.User;

public interface UserBiz {

	public User login(String username,String password);
	
	public User reg(User user);
	
	public boolean changePwd(String userId, String oldPwd, String newPwd);
	
	public User changeUserInfo(String userId,String nickname, String email, String qq, String tel);
	
}
