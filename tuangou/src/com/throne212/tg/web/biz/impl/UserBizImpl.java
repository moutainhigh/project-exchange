package com.throne212.tg.web.biz.impl;

import java.awt.geom.Area;
import java.util.Date;

import com.throne212.tg.web.biz.UserBiz;
import com.throne212.tg.web.common.EncryptUtil;
import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.dao.UserDao;
import com.throne212.tg.web.domain.User;

public class UserBizImpl extends BaseBizImpl implements UserBiz {

	private UserDao userDao;

	public User login(String username, String pwd) {
		User user = userDao.getEntityByUniqueColumn(User.class, "loginName", username);
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

	public User regUser(User user, Long topArea) {
		user.setPassword(EncryptUtil.md5Encode(user.getPassword()));// 密码加密
		user.setRegDate(new Date());
		userDao.saveOrUpdate(user);
		return user;
	}

	public boolean changePwd(User user, String pwd) {
		user.setPassword(EncryptUtil.md5Encode(pwd));
		userDao.saveOrUpdate(user);
		return true;
	}

	

	public PageBean<User> getAllUsers(Integer page) {
		if (page == null || page < 1)
			page = 1;
		return userDao.getAllUsers(page);
	}

	public PageBean<User> getAllUsers(Integer page, String key) {
		return userDao.queryUsersByKey(key, page);
	}


	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
