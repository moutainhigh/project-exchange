package com.throne212.proj.biz.impl;

import com.throne212.proj.biz.UserBiz;
import com.throne212.proj.common.MyUtil;
import com.throne212.proj.dao.BaseDao;
import com.throne212.proj.domain.User;

public class UserBizImpl extends BaseBizImpl implements UserBiz {

	private BaseDao baseDao;

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	public User login(String loginName, String password) {
		logger.info("logname=[" + loginName + "] pwd[" + password + "] try to login...");
		if (MyUtil.isEmpty(loginName) || MyUtil.isEmpty(password))
			return null;
		User user = baseDao.getEntityByUniqueColumn(User.class, "loginName", loginName);
		if (user == null)
			return null;
		if (user.getPassword().equals(password) || user.getPassword().equals(MyUtil.md5Encode(password))) {
			logger.info("longin success : " + loginName);
			return user;
		} else {
			return null;
		}
	}

}
