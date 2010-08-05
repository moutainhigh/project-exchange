package com.throne212.auto.biz.impl;

import com.throne212.auto.biz.UserBiz;
import com.throne212.auto.common.EncryptUtil;
import com.throne212.auto.dao.UserDao;
import com.throne212.auto.domain.Admin;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.User;

public class UserBizImpl extends BaseBizImpl implements UserBiz {

	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public User login(String loginName, String password) {
		User user = userDao.getUserByLoginName(loginName);
		logger.debug("user=" + user);
		if (user != null && user.getPassword()!=null && 
				(user.getPassword().equals(password) || user.getPassword().equals(EncryptUtil.md5Encode(password)))) {
			return user;
		}
		return null;
	}

	public boolean changePwd(Long userId, String oldPwd, String newPwd) {
		User user = userDao.getEntityById(User.class, userId);
		if(user.getPassword().equals(oldPwd) || user.getPassword().equals(EncryptUtil.md5Encode(oldPwd))){
			user.setPassword(EncryptUtil.md5Encode(newPwd));
			if(user instanceof Admin)
				userDao.saveOrUpdate((Admin)user);
			else
				userDao.saveOrUpdate((Sale)user);
			return true;
		}
		return false;
	}
}
