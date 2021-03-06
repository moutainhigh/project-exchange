package com.throne212.saishi.biz.impl;


import com.throne212.saishi.biz.UserBiz;
import com.throne212.saishi.common.EncryptUtil;
import com.throne212.saishi.domain.User;


public class UserBizImpl extends BaseBizImpl implements UserBiz {
	public User login(String username, String pwd) {
		User user = baseDao.getEntityByUniqueColumn(User.class, "loginName", username);
		if (user == null) {
			logger.info("登录失败，用户名不存在:" + username);
			return null;
		}
		if (pwd.equals(user.getPassword()) || EncryptUtil.md5Encode(pwd).equals(user.getPassword())) {
			logger.info("登录成功：" + username);
			return user;
		} else {
			logger.info("登录失败，密码错误:" + username + ":" + pwd);
			return null;
		}
	}
	public boolean changePwd(User user, String pwd) {
		user.setPassword(EncryptUtil.md5Encode(pwd));
		baseDao.saveOrUpdate(user);
		return true;
	}
}
